import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/nouvelleCollectionEntity.dart';
import 'package:petshop/domain/entites/nouvelle_collection_params.dart';
import 'package:petshop/domain/repositories/nouvelle_collection_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetNouvelleCollection
    extends UseCase<NouvelleCollectionEntity, NouvelleCollectionParams> {
  final NouvelleCollectionRepository nouvelleCollectionRepository;

  GetNouvelleCollection(this.nouvelleCollectionRepository);

  @override
  Future<Either<AppError, NouvelleCollectionEntity>> call(
      NouvelleCollectionParams params) async {
    return await nouvelleCollectionRepository.getNouvellesCollection(params.id);
  }
}
