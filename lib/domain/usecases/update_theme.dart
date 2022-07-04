import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/repositories/app_repository.dart';
import 'package:petshop/domain/usecases/usecase.dart';

class UpdateTheme extends UseCase<void, String> {
  final AppRepository _appRepository;

  UpdateTheme(this._appRepository);

  @override
  Future<Either<AppError, void>> call(String params) async {
    return await _appRepository.updateTheme(params);
  }
}
