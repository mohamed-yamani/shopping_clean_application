import 'dart:io';

import 'package:petshop/data/data_sources/sub_category_remote_data_source.dart';
import 'package:petshop/data/models/sub_category_model.dart';
import 'package:petshop/domain/entites/sub_category_entity.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/repositories/sub_category_repository.dart';

class SubCategoryRepositoryImpl extends SubCategoryRepository {
  final SubCategoryRemoteDataSource _subCategoryRemoteDataSource;

  SubCategoryRepositoryImpl(this._subCategoryRemoteDataSource);
  
  @override
  Future<Either<AppError, List<SubCategoryEntity>>> getSubCategories({required int id}) async {
    try {
      final List<SubCategoryModel> subCategories = await _subCategoryRemoteDataSource.getSubCategories(id);
      return Right(subCategories);
    }  on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  
}