import 'dart:io';

import 'package:petshop/data/core/unauthorized_exeption.dart';
import 'package:petshop/data/data_sources/authentication_local_data_source.dart';
import 'package:petshop/data/models/request_token_model.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop/domain/repositories/authentication_repository.dart';

import '../data_sources/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(this._authenticationRemoteDataSource,
      this._authenticationLocalDataSource);

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await _authenticationRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body) async {
    final requestTokenEitherResponse = await _getRequestToken();
    final String token1 =
        requestTokenEitherResponse.fold((l) => '', (r) => r.requestToken);
    try {
      body.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
          await _authenticationRemoteDataSource.validateWithLogin(body);
      final sessionId = await _authenticationRemoteDataSource
          .createSession(validateWithLoginToken.toJson());
      if (sessionId.isNotEmpty) {
        await _authenticationLocalDataSource.saveSessionId(sessionId);
        return const Right(true);
      } else {
        return const Left(AppError(AppErrorType.sessionDenied));
      }
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return const Left(AppError(AppErrorType.unauthorized));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _authenticationLocalDataSource.getSessionId();
    try {
      await _authenticationRemoteDataSource.deleteSession(sessionId);
      print('delete session remote from authenticationRepositoryImpl.dart');
      await _authenticationLocalDataSource.deleteSessionId();
      print('delete session local from authenticationRepositoryImpl.dart');
      return const Right(Unit);
    } on SocketException {
      print('SocketException network from authenticationRepositoryImpl.dart');
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      print('Exception api from authenticationRepositoryImpl.dart');
      return const Left(AppError(AppErrorType.api));
    }
  }
}
