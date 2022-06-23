import 'package:petshop/data/models/product_model.dart';

class ProductResultModel {
  int? count;
  String? next;
  String? previous;
  List<ProductModel>? products;

  ProductResultModel({this.count, this.next, this.previous, this.products});

  ProductResultModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      products = <ProductModel>[];
      json['results'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
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
