import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:petshop/data/data_sources/product_remote_data_source.dart';
import 'package:petshop/data/models/product_details_model.dart';
import 'package:petshop/data/models/product_model.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImpl(this._productRemoteDataSource);

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
  Future<Either<AppError, List<ProductEntity>>> getNewProducts() async {
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
  Future<Either<AppError, List<ProductEntity>>> getPopularProducts() async {
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
  Future<Either<AppError, List<ProductEntity>>> getPromotionProducts() async {
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
}
