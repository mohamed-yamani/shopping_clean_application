import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/data/models/nouvelle_collection_model.dart';

abstract class NouvelleCollectionRemoteDataSource {
  Future<NouvelleCollectionModel> getNouvellesCollection(int id);
}

class NouvelleCollectionRemoteDataSourceImpl
    implements NouvelleCollectionRemoteDataSource {
  final ApiClient _client;

  NouvelleCollectionRemoteDataSourceImpl(this._client);

  @override
  Future<NouvelleCollectionModel> getNouvellesCollection(int id) async {
    final response = await _client.get('/api/nouvelle-collection/$id');

    return NouvelleCollectionModel.fromJson(response);
  }
}
