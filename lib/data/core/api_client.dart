import 'dart:convert';

import 'package:http/http.dart';
import 'package:petshop/data/core/api_constants.dart';

class ApiClient {
  final Client _client;
  final String _baseUrl = ApiConstants.baseUrl;

  ApiClient(this._client);

  dynamic get(String _path) async {
    print('$_baseUrl$_path');
    final response = await _client.get(Uri.parse('$_baseUrl$_path'), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}
