import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:petshop/data/data_sources/google_auth_remote_data_source.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/auth_entity.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final GoogleAuthRemoteDataSource googleAuthRemoteDataSource;

  AuthRepositoryImpl({required this.googleAuthRemoteDataSource});
  @override
  Future<Either<AppError, AuthEntity>> signInWithGoogle() async {
    try {
      return await googleAuthRemoteDataSource.signInWithGoogleRemoteData();
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.unknown));
    }
  }
}
