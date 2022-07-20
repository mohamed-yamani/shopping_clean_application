import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';
import 'package:petshop/domain/entites/convert_token_params.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetConvertToken
    extends UseCase<ConvertTokenEntity, ConvertTokenParams> {
  final AuthRepository _repository;

  GetConvertToken(this._repository);
  @override
  Future<Either<AppError, ConvertTokenEntity>> call(
      ConvertTokenParams params) async {
    return await _repository.convertToken(params.clientId, params.clientSecret,
        params.backend, params.refreshToken, params.grantType);
  }
}
