import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:temry_market/data/models/product/product_model.dart';

import 'package:temry_market/core/error/exceptions.dart';

abstract class ProductLocalDataSource {
  Future<ProductModel> getLastProducts();
  Future<void> saveProducts(ProductModel productsToCache);
}

const cachedProducts = 'CACHED_PRODUCTS';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;
  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<ProductModel> getLastProducts() {
    final jsonString = sharedPreferences.getString(cachedProducts);
    if (jsonString != null) {
      return Future.value(ProductModel(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveProducts(ProductModel productsToCache) {
    return sharedPreferences.setString(
      cachedProducts,
      json.encode(ProductModel(productsToCache)),
    );
  }
}
