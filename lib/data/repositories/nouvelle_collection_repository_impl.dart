import 'dart:io';

import 'package:petshop/data/data_sources/nouvelle_collection_remote_data_source.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/data/models/nouvelle_collection_model.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/repositories/nouvelle_collection_repository.dart';

class NouvelleCollectionRepositoryImpl extends NouvelleCollectionRepository {
  final NouvelleCollectionRemoteDataSource _nouvelleCollectionRemoteDataSource;

  NouvelleCollectionRepositoryImpl(this._nouvelleCollectionRemoteDataSource);

  @override
  Future<Either<AppError, NouvelleCollectionModel>> getNouvellesCollection(
      int id) async {
    try {
      final product = await _nouvelleCollectionRemoteDataSource
          .getNouvellesCollection(id);
      return Right(product);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
