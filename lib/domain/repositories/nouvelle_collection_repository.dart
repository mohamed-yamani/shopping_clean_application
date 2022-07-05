import 'package:dartz/dartz.dart';
import 'package:petshop/data/models/nouvelle_collection_model.dart';
import 'package:petshop/domain/entites/app_error.dart';

abstract class NouvelleCollectionRepository {
  Future<Either<AppError, NouvelleCollectionModel>> getNouvellesCollection(
      int id);
}
