import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/product_by_category_params.dart';
import 'package:petshop/domain/entites/producte_result_entity.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetProductByCategory extends UseCase<ProductResultEntity, ProductByCategoryParams> {
  final ProductRepository productRepository;

  GetProductByCategory(this.productRepository);

  @override
  Future<Either<AppError, ProductResultEntity>> call(
      ProductByCategoryParams params) async {
    return await productRepository.getProductByCategory(params.id, params.page);
  }
}
