part of 'serach_product_bloc.dart';

abstract class SerachProductState extends Equatable {
  const SerachProductState();

  @override
  List<Object> get props => [];
}

class SerachProductInitial extends SerachProductState {}

class SerachProductLoaded extends SerachProductState {
  final List<ProductEntity> products;

  const SerachProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class SerachProductLoading extends SerachProductState {}

class SerachProductError extends SerachProductState {
  final AppError error;

  const SerachProductError(this.error);

  @override
  List<Object> get props => [error];
}
