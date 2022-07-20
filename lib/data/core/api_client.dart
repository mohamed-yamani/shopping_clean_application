import 'dart:convert';

import 'package:http/http.dart';
import 'package:petshop/data/core/api_constants.dart';
import 'package:petshop/data/core/unauthorized_exeption.dart';

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

  dynamic post(String path, {required Map<dynamic, dynamic> params}) async {
    print(' 5');
    final response = await _client.post(
      Uri.parse('$_baseUrl$path'),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 401) {
      print(' 6');
      throw UnauthorizedException();
    } else {
      print(' 7' + response.toString());
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic deleteWithBody(String path,
      {Map<dynamic, dynamic> queryParameters = const {}}) async {
    Request request = Request('DELETE', Uri.parse('$_baseUrl$path'));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(queryParameters);

    final response =
        await _client.send(request).then((value) => Response.fromStream(value));

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
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
