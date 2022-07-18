// ignore_for_file: void_checks

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:petshop/data/data_sources/product_local_data_source.dart';
import 'package:petshop/data/data_sources/product_remote_data_source.dart';
import 'package:petshop/data/models/product_details_model.dart';
import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/data/tables/product_table.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/photo_product_color_entity.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/domain/entites/producte_result_entity.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;
  final ProductLocalDataSource _productLocalDataSource;

  ProductRepositoryImpl(
      this._productRemoteDataSource, this._productLocalDataSource);

  @override
  Future<Either<AppError, List<ProductModel>>> getProducts() async {
    try {
      final products = await _productRemoteDataSource.getProducts();
      return Right(products);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<ProductModel>>> getNewProducts() async {
    try {
      final products = await _productRemoteDataSource.getNewProducts();
      return Right(products);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<ProductModel>>> getPopularProducts() async {
    try {
      final products = await _productRemoteDataSource.getPopularProducts();
      return Right(products);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<ProductModel>>> getPromotionProducts() async {
    try {
      final products = await _productRemoteDataSource.getPromotionProducts();
      return Right(products);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ProductDetailsModel>> getProductDetails(
      int id) async {
    try {
      final productDetails =
          await _productRemoteDataSource.getProductDetails(id);
      return Right(productDetails);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<ProductModel>>> getSearchProducts(
      String searchTerm) async {
    try {
      final products =
          await _productRemoteDataSource.getSearchProducts(searchTerm);
      return Right(products);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfProductFavorite(int productId) async {
    try {
      final response =
          await _productLocalDataSource.checkIfProductFavorite(productId);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavoriteProduct(int productId) async {
    try {
      final response = await _productLocalDataSource.deleteProduct(productId);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<ProductEntity>>> getFavoriteProducts() async {
    try {
      final response = await _productLocalDataSource.getProducts();
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveFavoriteProduct(
      ProductEntity product) async {
    try {
      final response = await _productLocalDataSource
          .saveProduct(ProductTable.fromProductEntity(product));
      print('product saved with id: ${product.id}');
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<PhotoProductColorEntity>>> getPhotoProductColor(
      String codeCouleur, String produitId) async {
    try {
      final response = await _productRemoteDataSource.getPhotoProductColor(
          codeCouleur, produitId);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, ProductResultEntity>> getProductByCategory(
      int id, int page) async {
    try {
      final response = await _productRemoteDataSource.getProductByCategory(id: id, page: page);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
