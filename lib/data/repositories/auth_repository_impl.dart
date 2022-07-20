import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:petshop/data/data_sources/convert_token_remote_data_source.dart';
import 'package:petshop/data/data_sources/google_auth_remote_data_source.dart';
import 'package:petshop/data/data_sources/sign_in_local_data_source.dart';
import 'package:petshop/data/tables/convert_token_table.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/auth_entity.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';
import 'package:petshop/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final GoogleAuthRemoteDataSource googleAuthRemoteDataSource;
  final ConvertTokenRemoteDataSource convertTokenRemoteDataSource;
  final SessionLocalDataSource signInLocalDataSource;

  AuthRepositoryImpl(
      {required this.signInLocalDataSource,
      required this.googleAuthRemoteDataSource,
      required this.convertTokenRemoteDataSource});
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

  @override
  Future<Either<AppError, ConvertTokenEntity>> convertToken(
      String clientId,
      String clientSecret,
      String backend,
      String refreshToken,
      String grantType) async {
    try {
      final ConvertTokenEntity convertTokenEntity =
          await convertTokenRemoteDataSource.convertToken(
              clientId, clientSecret, backend, refreshToken, grantType);
      print('convertTokenEntity in auth_repo: ${convertTokenEntity.tokenType}');
      return Right(convertTokenEntity);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.unknown));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfSessionExists() async {
    try {
      final bool isSessionExists =
          await signInLocalDataSource.checkIfSessionExists();
      return Right(isSessionExists);
    } on SocketException {
      return const Left(AppError(AppErrorType.database));
    } on Exception {
      return const Left(AppError(AppErrorType.unknown));
    }
  }

  @override
  Future<Either<AppError, void>> deleteSession() async {
    try {
      final response = await signInLocalDataSource.deleteSession();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.database));
    } on Exception {
      return const Left(AppError(AppErrorType.unknown));
    }
  }

  @override
  Future<Either<AppError, ConvertTokenEntity>> getSession() async {
    try {
      final ConvertTokenEntity response =
          await signInLocalDataSource.getSession();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.database));
    } on Exception {
      return const Left(AppError(AppErrorType.unknown));
    }
  }

  @override
  Future<Either<AppError, void>> saveNewSession(
      ConvertTokenEntity convertToken) async {
    try {
      final response = await signInLocalDataSource.saveNewSession(
          ConvertTokenTable(
              accessToken: convertToken.accessToken,
              expiresIn: convertToken.expiresIn,
              tokenType: convertToken.tokenType,
              scope: convertToken.scope,
              refreshToken: convertToken.refreshToken));
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.database));
    } on Exception {
      return const Left(AppError(AppErrorType.unknown));
    }
  }
}
