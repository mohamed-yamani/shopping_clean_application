import 'package:hive/hive.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';

part 'convert_token_table.g.dart';

@HiveType(typeId: 1)
class ConvertTokenTable extends ConvertTokenEntity {
  @HiveField(0)
  final String? accessToken;
  @HiveField(1)
  final int? expiresIn;
  @HiveField(2)
  final String? tokenType;
  @HiveField(3)
  final String? scope;
  @HiveField(4)
  final String? refreshToken;

  const ConvertTokenTable(
      {required this.accessToken,
      required this.expiresIn,
      required this.tokenType,
      required this.scope,
      required this.refreshToken})
      : super(
            accessToken: accessToken,
            expiresIn: expiresIn,
            tokenType: tokenType,
            scope: scope,
            refreshToken: refreshToken);

  // ConvertTokenTable.fromJson(Map<String, dynamic> json) {
  //   accessToken = json['access_token'];
  //   expiresIn = json['expires_in'];
  //   tokenType = json['token_type'];
  //   scope = json['scope'];
  //   refreshToken = json['refresh_token'];
  // }

  factory ConvertTokenTable.fromJson(Map<String, dynamic> json) {
    return ConvertTokenTable(
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      tokenType: json['token_type'],
      scope: json['scope'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['expires_in'] = expiresIn;
    data['token_type'] = tokenType;
    data['scope'] = scope;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
