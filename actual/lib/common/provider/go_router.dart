import 'package:actual/user/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/*
  routerProvider
    - Provider를 활용하여 GoRouter를 관리함.
    - 초기 페이지를 splashScreen으로 지정하고, authProvider(auth 인증 상태관리)의 상태값을 읽어옴.
    - 읽어온 (auth)provider로 상태를 지켜보며 redirect

*/
final routerProvider = Provider<GoRouter>((ref) {
  // watch - 값이 변경될 떄마다 다시 빌드
  // read - 한번만 읽고 값이 변경돼도 다시 빌드하지 않음.
  final provider = ref.read(authProvider);

  return GoRouter(
    routes: provider.routes,
    initialLocation: '/splash',
    refreshListenable: provider,    // 값으로 입력된 provider의 상태를 지켜봄. (Listeneble 타입은 ChangeNotifier를 상속하기 때문에 ChangeNotifierProvider를 사용함)
    redirect: (_, state) => provider.redirectLogic(state),  // refreshListenable의 값을 지켜보면서 redirect 시킨다.
  );
});
