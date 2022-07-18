import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:petshop/data/models/product_model.dart';

class ProductResultEntity extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<ProductModel>? products;

  const ProductResultEntity(
      {@required this.count,
      @required this.next,
      @required this.previous,
      @required this.products});

  @override
  List<Object?> get props => [count, next, previous, products];

  copyWith({required List<ProductModel> products}) {}
}
