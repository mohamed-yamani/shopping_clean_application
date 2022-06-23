part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
}

class ProductDataLoadEvent extends ProductDetailsEvent {
  final int productId;

  const ProductDataLoadEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}
