import 'package:actual/common/component/pagination_list_view.dart';
import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:actual/restaurant/provider/restaurant_provider.dart';
import 'package:actual/restaurant/view/restaurant_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantScreen extends StatelessWidget {
  // final ScrollController controller = ScrollController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   controller.addListener(scrollListener);
  // }
  //
  // void scrollListener() {
  //   // // 현재 위치가
  //   // // 최대 길이보다 조금 덜되는 위치까지 왔다면
  //   // // 새로운 데이터를 추가요청
  //   // if (controller.offset > controller.position.maxScrollExtent - 300) {
  //   //   ref.read(restaurantProvider.notifier).paginate(
  //   //         fetchMore: true,
  //   //       );
  //   // }
  //
  //   // 모듈화
  //   PaginationUtils.paginate(
  //     controller: controller,
  //     provider: ref.read(
  //       restaurantProvider.notifier,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: restaurantProvider,
      itemBuilder: <RestaurantModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            context.goNamed(RestaurantDetailScreen.routeName, pathParameters: {
              'rid': model.id,
            });
          },
          child: RestaurantCard.fromModel(
            model: model,
          ),
        );
      },
    );

    // final data = ref.watch(restaurantProvider);
    //
    // // 완전 처음 로딩일때
    // if (data is CursorPaginationLoading) {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    //
    // // 에러
    // if (data is CursorPaginationError) {
    //   return Center(
    //     child: Text(data.message),
    //   );
    // }
    //
    // // CursorPagination
    // // CursorPaginationFetchingMore
    // // CursorPaginationRefetching
    //
    // final cp = data as CursorPagination;
    //
    // return Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //     child: ListView.separated(
    //       controller: controller,
    //       itemCount: cp.data.length + 1,
    //       itemBuilder: (_, index) {
    //         if (index == cp.data.length) {
    //           return Padding(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 16.0,
    //               vertical: 8.0,
    //             ),
    //             child: Center(
    //               child: data is CursorPaginationFetchingMore
    //                   ? CircularProgressIndicator()
    //                   : Text('마지막 데이터입니다.'),
    //             ),
    //           );
    //         }
    //
    //         final pItem = cp.data[index];
    //
    //         return GestureDetector(
    //           onTap: () {
    //             Navigator.of(context).push(
    //               MaterialPageRoute(
    //                   builder: (_) => RestaurantDetailScreen(
    //                         id: pItem.id,
    //                       )),
    //             );
    //           },
    //           child: RestaurantCard.fromModel(
    //             model: pItem,
    //           ),
    //         );
    //       },
    //       separatorBuilder: (_, index) {
    //         return SizedBox(height: 16.0);
    //       },
    //     ));
  }
}
