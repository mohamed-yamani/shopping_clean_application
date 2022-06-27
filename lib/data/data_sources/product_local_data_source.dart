import 'package:hive/hive.dart';
import 'package:petshop/data/tables/product_table.dart';

abstract class ProductLocalDataSource {
  Future<void> saveProduct(ProductTable product);
  Future<List<ProductTable>> getProducts();
  Future<void> deleteProduct(int productId);
  Future<bool> checkIfProductFavorite(int productId);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  @override
  Future<bool> checkIfProductFavorite(int productId) async {
    late final Box productBox;
    if (Hive.isBoxOpen('productBox')) {
      productBox = Hive.box('productBox');
    } else {
      productBox = await Hive.openBox('productBox');
    }
    return productBox.containsKey(productId);
  }

  @override
  Future<void> deleteProduct(int productId) async {
    late final Box productBox;
    if (Hive.isBoxOpen('productBox')) {
      productBox = Hive.box('productBox');
    } else {
      productBox = await Hive.openBox('productBox');
    }
    productBox.delete(productId);
  }

  @override
  Future<List<ProductTable>> getProducts() async {
    late final Box productBox;
    if (Hive.isBoxOpen('productBox')) {
      productBox = Hive.box('productBox');
    } else {
      productBox = await Hive.openBox('productBox');
    }
    final keys = productBox.keys;
    List<ProductTable> products = [];
    for (final key in keys) {
      products.add(productBox.get(key));
    }
    return products;
  }

  @override
  Future<void> saveProduct(ProductTable productTable) async {
    late final Box productBox;
    if (Hive.isBoxOpen('productBox')) {
      productBox = Hive.box('productBox');
    } else {
      productBox = await Hive.openBox('productBox');
    }
    await productBox.put(productTable.id, productTable);
  }
}
