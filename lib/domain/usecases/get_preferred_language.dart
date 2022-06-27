import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/entites/no_params.dart';
import 'package:petshop/domain/repositories/app_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class GetPreferredLanguage extends UseCase<String, NoParams> {
  final AppRepository _appRepository;

  GetPreferredLanguage(this._appRepository);
  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await _appRepository.getPreferredLanguage();
  }
}
