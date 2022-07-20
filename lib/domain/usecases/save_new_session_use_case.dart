import 'package:dartz/dartz.dart';
import 'package:petshop/data/tables/convert_token_table.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class SaveNewSessionUseCase extends UseCase<void, ConvertTokenEntity> {
  final AuthRepository repository;

  SaveNewSessionUseCase({required this.repository});
  @override
  Future<Either<AppError, void>> call(ConvertTokenEntity params) async {
    return await repository.saveNewSession(params);
  }
}
