import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<AppError, List<ProductEntity>>> getProducts();
  Future<Either<AppError, List<ProductEntity>>> getNewProducts();
  Future<Either<AppError, List<ProductEntity>>> getPopularProducts();
  Future<Either<AppError, List<ProductEntity>>> getPromotionProducts();
  Future<Either<AppError, ProductDetailsEntity>> getProductDetails(int id);
}
