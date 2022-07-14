import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/domain/entites/producte_result_entity.dart';

class ProductResultModel extends ProductResultEntity {
  int? count;
  String? next;
  String? previous;
  List<ProductModel>? products;

  ProductResultModel({this.count, this.next, this.previous, this.products})
      : super(count: count, next: next, previous: previous, products: products);

  factory ProductResultModel.fromJson(Map<String, dynamic> json) {
    return ProductResultModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      products: json['results'] != null
          ? (json['results'] as List)
              .map((i) => ProductModel.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (products != null) {
      data['results'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
