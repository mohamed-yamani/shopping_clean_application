import 'package:petshop/data/core/api_client.dart';
import 'package:petshop/data/models/sub_category_model.dart';

abstract class SubCategoryRemoteDataSource {
  /// Retrieves a [SubCategory] from the remote data source.
  Future<List<SubCategoryModel>> getSubCategories(int id);
}

class SubCategoryRemoteDataSourceImpl extends SubCategoryRemoteDataSource {
  final ApiClient _client;

  SubCategoryRemoteDataSourceImpl(this._client);
  
  @override
  Future<List<SubCategoryModel>> getSubCategories(int id) async {
    List<SubCategoryModel> subCategories = [];

    final response = await _client.get('/api/menu/$id/last_childs/');
    print("last childs response: $response");
    await response.forEach((element) {
      subCategories.add(SubCategoryModel.fromJson(element));
    });
    return subCategories;
  }


}
