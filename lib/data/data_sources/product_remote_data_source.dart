// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/data/models/photo_product_model.dart';
import 'package:petshop/data/models/product_details_model.dart';
import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/data/models/product_result_model.dart';

abstract class ProductRemoteDataSource {
  /// Retrieves a [Product] from the remote data source.
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getNewProducts();
  Future<List<ProductModel>> getPopularProducts();
  Future<List<ProductModel>> getPromotionProducts();
  Future<List<ProductModel>> getSearchProducts(String searchTerm);
  Future<ProductDetailsModel> getProductDetails(int id);
  Future<List<PhotoProduitColorModel>> getPhotoProductColor(
      String codeCouleur, String produitId);
  Future<ProductResultModel> getProductByCategory(int id);
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

  @override
  Future<List<ProductModel>> getSearchProducts(String searchTerm) async {
    final response = await _client
        .get('/api/produit?search', queryParameters: {'search': searchTerm});
    final products = ProductResultModel.fromJson(response).products;
    return products!;
  }

  @override
  Future<List<PhotoProduitColorModel>> getPhotoProductColor(
      String codeCouleur, String produitId) async {
    List<PhotoProduitColorModel>? photosProductColor = [];
    final response = await _client.get(
        '/api/photo-produit-couleur/?produit=$produitId&couleur=\'$codeCouleur\'');

    print('color is $codeCouleur and product is $produitId');
    await response.forEach((element) {
      photosProductColor.add(PhotoProduitColorModel.fromJson(element));
    });
    return photosProductColor;
  }

  @override
  Future<ProductResultModel> getProductByCategory(int id) async {
    final response = await _client.get('/api/produit?categorie=$id');
    final products = ProductResultModel.fromJson(response);
    return products;
  }
}
