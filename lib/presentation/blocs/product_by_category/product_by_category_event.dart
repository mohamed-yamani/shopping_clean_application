part of 'product_by_category_bloc.dart';

abstract class ProductByCategoryEvent extends Equatable {
  const ProductByCategoryEvent();
}

class ProductByCategoryLoadEvent extends ProductByCategoryEvent {
  final int categoryId;
  final int page;

  const ProductByCategoryLoadEvent(
      {required this.categoryId, required this.page});

  @override
  List<Object?> get props => [categoryId, page];
}
