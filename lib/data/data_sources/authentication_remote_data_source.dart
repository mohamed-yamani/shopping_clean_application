import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/data/models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  /// Throws [ServerException] for all error codes.
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String> createSession(Map<String, dynamic> requestBody);
  Future<bool> deleteSession(String sessionId);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final response = await _client.get('/authentication/token/new');
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      '/api/otp/otp_authenticate/',
      params: requestBody,
    );
    print(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<String> createSession(Map<String, dynamic> requestBody) {
    final response = _client.post(
      '/api/otp/otp_authenticate/',
      params: requestBody,
    );
    return response['success'] ? response['session_id'] : null;
  }

  @override
  Future<bool> deleteSession(String sessionId) async {
    final response = await _client.deleteWithBody(
      '/api/otp/otp_authenticate/',
      queryParameters: {'session_id': sessionId},
    );
    return response['success'] ? true : false;
  }
}
