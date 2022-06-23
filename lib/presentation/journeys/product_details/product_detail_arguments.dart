import 'package:equatable/equatable.dart';

class ProductDetailArguments extends Equatable {
  final int productId;

  const ProductDetailArguments({required this.productId});

  @override
  List<Object?> get props => [productId];
}
