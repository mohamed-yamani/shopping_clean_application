import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:petshop/data/data_sources/menu_remote_data_source.dart';
import 'package:petshop/data/models/menu_model.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/menu_entity.dart';
import 'package:petshop/domain/repositories/menu_repositories.dart';

class MenuRepositoryImpl extends MenuRepository {
  final MenuRemoteDataSource _menuRemoteDataSource;

  MenuRepositoryImpl(this._menuRemoteDataSource);

  @override
  Future<Either<AppError, List<MenuEntity>>> getMenus() async {
    try {
      final List<MenuModel>? menu = await _menuRemoteDataSource.getMenu();
      return Right(menu!);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
