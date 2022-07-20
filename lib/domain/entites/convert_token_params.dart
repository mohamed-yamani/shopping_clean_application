import 'package:equatable/equatable.dart';

class ConvertTokenParams extends Equatable {
  final String clientId;
  final String clientSecret;
  final String backend;
  final String refreshToken;
  final String grantType;

  const ConvertTokenParams(
      {required this.clientId,
      required this.clientSecret,
      required this.backend,
      required this.refreshToken,
      required this.grantType});

  @override
  List<Object?> get props =>
      [clientId, clientSecret, backend, refreshToken, grantType];
}
