import 'package:dartz/dartz.dart';
import 'package:petshop/data/models/sub_category_model.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/sub_category_entity.dart';
import 'package:petshop/domain/entites/sub_category_params.dart';
import 'package:petshop/domain/repositories/sub_category_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetSubCatogeries extends UseCase<List<SubCategoryEntity>, SubCategoryParams> {
  final SubCategoryRepository subCategoryRepository;

  GetSubCatogeries(this.subCategoryRepository);

  @override
  Future<Either<AppError, List<SubCategoryEntity>>> call(SubCategoryParams params) async {
    return await subCategoryRepository.getSubCategories(id: params.id);
  }
}