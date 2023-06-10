import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/common/provider/pagination_provider.dart';
import 'package:actual/product/model/product_model.dart';
import 'package:actual/product/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// productProvider는 결국 뷰에서 사용된다. (product_tab)
final productProvider = StateNotifierProvider<ProductStateNotifier, CursorPaginationBase>((ref) {
  final repo = ref.watch(productRepositoryProvider);

  return ProductStateNotifier(repository: repo);
});

class ProductStateNotifier extends PaginationProvider<ProductModel, ProductRepository> {
  ProductStateNotifier({
    required super.repository,
  });
}