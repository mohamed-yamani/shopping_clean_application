part of 'product_by_category_bloc.dart';

abstract class ProductByCategoryState extends Equatable {
  const ProductByCategoryState();

  @override
  List<Object> get props => [];
}

class ProductByCategoryInitialState extends ProductByCategoryState {}

class ProductByCategoryLoadingState extends ProductByCategoryState {}

class ProductByCategoryErrorState extends ProductByCategoryState {}

class ProductByCategoryLoadedState extends ProductByCategoryState {
  final ProductResultEntity productResult;
  final int categoryId;

  const ProductByCategoryLoadedState(
      {required this.productResult, required this.categoryId});

  @override
  List<Object> get props => [productResult, categoryId];
}
