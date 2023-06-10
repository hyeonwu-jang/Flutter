import 'package:actual/common/provider/pagination_provider.dart';
import 'package:flutter/cupertino.dart';

// 추가 데이터를 요청하고 받아오는 scrollListener메소드의 일반화를 위한 클래스
class PaginationUtils {
  static void paginate({
    required ScrollController controller,
    required PaginationProvider provider,
  }) {
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      provider.paginate(
        fetchMore: true,
      );
    }
  }
}