import 'package:dartz/dartz.dart';
import 'package:petshop/data/tables/convert_token_table.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetSessionUseCase extends UseCase<ConvertTokenEntity, NoParams> {
  final AuthRepository repository;

  GetSessionUseCase({required this.repository});
  @override
  Future<Either<AppError, ConvertTokenEntity>> call(NoParams params) async {
    return await repository.getSession();
  }
}
