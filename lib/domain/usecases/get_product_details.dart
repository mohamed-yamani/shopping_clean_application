// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/domain/entites/product_params.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetProductDetails extends UseCase<ProductDetailsEntity, ProductParams> {
  final ProductRepository productRepository;

  GetProductDetails(this.productRepository);

  @override
  Future<Either<AppError, ProductDetailsEntity>> call(
      ProductParams productParams) async {
    return await productRepository.getProductDetails(productParams.id);
  }
}
