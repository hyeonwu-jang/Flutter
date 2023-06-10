import 'package:actual/common/const/data.dart';
import 'package:actual/common/dio/dio.dart';
import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/common/model/pagination_params.dart';
import 'package:actual/common/repository/base_pagination_repository.dart';
import 'package:actual/product/model/product_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'product_repository.g.dart';

// productRepositoryProvider의 역할은 토큰 여부에 따른 인터셉터 처리를 하는 dioProvider를 이용해
// dio 변수에서 토큰의 상태 관리를 하고, api통신을 하는 ProductRepository에게 dio 변수를 전달한다.
//
final productRepositoryProvider = Provider<ProductRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    return ProductRepository(dio, baseUrl: 'http://$ip/product');
  },
);

// http://$ip/product
// ProductRepository(Dio dio, {String baseUrl}) 에서 { }는 선택적 매개변수임.
// 즉 생성자를 이용해서 생성할 때 dio와 달리 baseUrl 인자는 선택적으로 받겠다는 뜻임.
// factory 생성자는 다른 방식으로 객체를 생성하고 반환함. (static과 유사)
// 일반적으로 싱글톤 패턴이나 객채 캐싱과 같은 상황에서 사용될 수 있음.
@RestApi()
abstract class ProductRepository implements IBasePaginationRepository<ProductModel> {
  factory ProductRepository(Dio dio, {String baseUrl}) = _ProductRepository;

  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<ProductModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
