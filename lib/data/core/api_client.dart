import 'dart:convert';

import 'package:http/http.dart';
import 'package:petshop/data/core/api_constants.dart';

class ApiClient {
  final Client _client;
  final String _baseUrl = ApiConstants.baseUrl;

  ApiClient(this._client);

  dynamic get(String path,
      {Map<dynamic, dynamic> queryParameters = const {}}) async {
    final String pathArrgument = getPath(path, queryParameters);
    final response =
        await _client.get(Uri.parse('$_baseUrl$pathArrgument'), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getPath(String path, Map<dynamic, dynamic> params) {
    var paramsString = '';

    if (params.isNotEmpty) {
      params.forEach((key, value) {
        paramsString += '&$key=$value';
      });
      return '$path?$paramsString';
    }
    return path;
  }
}
