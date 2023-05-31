import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/restaurant/model/restaurant_detail_model.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

part 'restaurant_repository.g.dart';


// factory 는 =을 통해 메소드의 바디를 지정할 수 있다.
@RestApi()
abstract class RestaurantRepository {
  // http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl})
   = _RestaurantRepository;

  // http://$ip/restaurant/
  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<CursorPagination<RestaurantModel>> paginate();

  // http://$ip/restaurant/:id/
  // @Path() 어노테이션을 사용하면 @GET의 ({id})라는 값을 가져온다.
  // @Path() 괄호 내부에 @GET('/{ }') 경로와 일치하는 이름을 매핑해주면 변수 이름을 달리해도 사용이 가능함.
  @GET('/{id}')
  @Headers({
    'accessToken': 'true',
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
});
}