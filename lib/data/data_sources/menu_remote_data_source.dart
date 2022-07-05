import 'dart:convert';

import 'package:http/http.dart';
import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/data/core/api_constants.dart';
import 'package:petshop/data/models/menu_model.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuModel>?> getMenu();
}

class MenuRemoteDataSourceImpl extends MenuRemoteDataSource {
  late final ApiClient _client;

  MenuRemoteDataSourceImpl(this._client);

  @override
  Future<List<MenuModel>?> getMenu() async {
    List<MenuModel>? menu = [];

    final response = await _client.get('/api/menu/');
    await response.forEach((element) {
      menu.add(MenuModel.fromJson(element));
    });
    return menu;
  }
}
