import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/photo_product_color_entity.dart';
import 'package:petshop/domain/entites/product_color_params.dart';
import 'package:petshop/domain/repositories/product_repositories.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetPhotoProductColor
    extends UseCase<List<PhotoProductColorEntity>, ProductColorParams> {
  final ProductRepository productRepository;

  GetPhotoProductColor(this.productRepository);

  @override
  Future<Either<AppError, List<PhotoProductColorEntity>>> call(
      ProductColorParams params) async {
    return await productRepository.getPhotoProductColor(
        params.codeCouleur, params.produitId);
  }
}
