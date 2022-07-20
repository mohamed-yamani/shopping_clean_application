import 'package:equatable/equatable.dart';

class ConvertTokenEntity extends Equatable {
  final String? accessToken;
  final int? expiresIn;
  final String? tokenType;
  final String? scope;
  final String? refreshToken;

  const ConvertTokenEntity(
      {required this.accessToken,
      required this.expiresIn,
      required this.tokenType,
      required this.scope,
      required this.refreshToken});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool get stringify => true;

  factory ConvertTokenEntity.fromJson(Map<String, dynamic> json) {
    return ConvertTokenEntity(
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      tokenType: json['token_type'],
      scope: json['scope'],
      refreshToken: json['refresh_token'],
    );
  }
}
