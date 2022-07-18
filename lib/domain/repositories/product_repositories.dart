import 'package:petshop/data/models/product_result_model.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/photo_product_color_entity.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/domain/entites/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/producte_result_entity.dart';

abstract class ProductRepository {
  Future<Either<AppError, List<ProductEntity>>> getProducts();
  Future<Either<AppError, List<ProductEntity>>> getNewProducts();
  Future<Either<AppError, List<ProductEntity>>> getPopularProducts();
  Future<Either<AppError, List<ProductEntity>>> getPromotionProducts();
  Future<Either<AppError, ProductDetailsEntity>> getProductDetails(int id);
  Future<Either<AppError, List<ProductEntity>>> getSearchProducts(
      String searchTerm);
  Future<Either<AppError, void>> saveFavoriteProduct(ProductEntity productId);
  Future<Either<AppError, void>> deleteFavoriteProduct(int productId);
  Future<Either<AppError, bool>> checkIfProductFavorite(int productId);
  Future<Either<AppError, List<ProductEntity>>> getFavoriteProducts();
  Future<Either<AppError, List<PhotoProductColorEntity>>> getPhotoProductColor(
      String codeCouleur, String produitId);
  Future<Either<AppError, ProductResultEntity>> getProductByCategory(
      int id, int page);
}
