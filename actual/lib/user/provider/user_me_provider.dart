import 'package:actual/common/const/data.dart';
import 'package:actual/common/secure_storage/secure_storage.dart';
import 'package:actual/user/model/user_model.dart';
import 'package:actual/user/provider/auth_provider.dart';
import 'package:actual/user/repository/auth_repository.dart';
import 'package:actual/user/repository/user_me_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// UserModelBase를 반환하는 StateNotifierProvider
// AuthRepository, UserMeRepository, FlutterSecureStorage를 통해 통합 처리

// AuthRepository : id, pw 입력값으로 로그인 수행, 
// UserMeRepository : 로그인 정보를 가져옴
// FlutterSecureStorage : 로그인 수행 및 로그인 정보를 바탕으로 토큰 저장 및 삭제 처리(로그인, 로그아웃 등)
// 이후 Provider를 통해 외부에서 사용할 수 있도록 state에 UserModelBase를 주입하여 상태를 관리함.
// 주입할 때는 UserMeRepository를 활용.

final userMeProvider = StateNotifierProvider<UserMeStateNotifier, UserModelBase?>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final userMeRepository = ref.watch(userMeRepositoryProvider);
    final storage = ref.watch(secureStorageProvider);

    return UserMeStateNotifier(
      authRepository: authRepository,
      repository: userMeRepository,
      storage: storage,
    );
  },
);

class UserMeStateNotifier extends StateNotifier<UserModelBase?> {
  final AuthRepository authRepository;  // id, pw를 받아서 로그인 처리하는 repo (refresh token -> access token)
  final UserMeRepository repository;    // 로그인 후 정보를 가져오는 repo
  final FlutterSecureStorage storage;   // 토큰 저장용

  UserMeStateNotifier({
    required this.authRepository,
    required this.repository,
    required this.storage,
  }) : super(UserModelLoading()) {
    // 내 정보 가져오기
    getMe();
  }

  Future<void> getMe() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      state = null;
      return;
    }
      final resp = await repository.getMe();

      state = resp;
  }

  // 로그인 에러가 발생할 가능성도 있기 떄문에 UserModelBase를 반환함.
  Future<UserModelBase> login({
    required String username,
    required String password,
  }) async {
    try {
      state = UserModelLoading();

      final resp = await authRepository.login(    // resp에는 토큰을 들고 있는 LoginResponse 인스턴스가 있음.
        username: username,
        password: password,
      );

      await storage.write(key: REFRESH_TOKEN_KEY, value: resp.refreshToken);
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.accessToken);

      final userResp = await repository.getMe();

      state = userResp;

      return userResp;
    } catch (e) {
      state = UserModelError(message: '로그인에 실패했습니다.');

      return Future.value(state);
    }
  }

  Future<void> logout() async {
    state = null;

    // 동시에 실행하는 함수
    await Future.wait(
      [
        storage.delete(key: REFRESH_TOKEN_KEY),
        storage.delete(key: ACCESS_TOKEN_KEY),
      ],
    );
  }
}
