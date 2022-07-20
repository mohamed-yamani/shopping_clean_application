import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/domain/entites/app_error.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';

abstract class ConvertTokenRemoteDataSource {
  Future<ConvertTokenEntity> convertToken(String clientId, String clientSecret,
      String backend, String refreshToken, String grantType);
}

class ConvertTokenRemoteDataSourceImpl extends ConvertTokenRemoteDataSource {
  final ApiClient _client;

  ConvertTokenRemoteDataSourceImpl(this._client);

  @override
  Future<ConvertTokenEntity> convertToken(String clientId, String clientSecret,
      String backend, String refreshToken, String grantType) async {
    final response = await _client.post(
        '/auth/convert-token?client_id=$clientId&client_secret=$clientSecret&backend=$backend&token=$refreshToken',
        params: {'grant_type': grantType});
    return ConvertTokenEntity.fromJson(response);
  }
}
