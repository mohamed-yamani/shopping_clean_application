// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/data/models/product_details_model.dart';
import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/data/models/product_result_model.dart';

abstract class ProductRemoteDataSource {
  /// Retrieves a [Product] from the remote data source.
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getNewProducts();
  Future<List<ProductModel>> getPopularProducts();
  Future<List<ProductModel>> getPromotionProducts();
  Future<ProductDetailsModel> getProductDetails(int id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  late final ApiClient _client;

  ProductRemoteDataSourceImpl(this._client);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _client.get('/api/produit/');
    final products = ProductResultModel.fromJson(response).products;
    return products!;
  }

  @override
  Future<List<ProductModel>> getNewProducts() async {
    final response = await _client.get('/api/produit/');
    final products = ProductResultModel.fromJson(response).products!;

    return products;
  }

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    final response = await _client.get('/api/produit/');
    final products = ProductResultModel.fromJson(response).products;
    return products!;
  }

  @override
  Future<List<ProductModel>> getPromotionProducts() async {
    final response = await _client.get('/api/produit/');
    final products = ProductResultModel.fromJson(response)
        .products!
        .where((element) => (element.promotion == true))
        .toList();
    ;
    return products;
  }

  @override
  Future<ProductDetailsModel> getProductDetails(int id) async {
    final response = await _client.get('/api/produit/$id');
    final products = ProductDetailsModel.fromJson(response);
    if (kDebugMode) {
      print(products);
    }
    return products;
  }
}
