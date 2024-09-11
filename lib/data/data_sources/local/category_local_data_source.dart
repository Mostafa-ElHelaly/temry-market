import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:temry_market/core/error/exceptions.dart';

import 'package:temry_market/data/models/category/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<CategoryModel> getCategories();
  Future<void> saveCategories(CategoryModel productsToCache);
}

const cachedCategory = 'CACHED_CATEGORIES';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final SharedPreferences sharedPreferences;
  CategoryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CategoryModel> getCategories() {
    final jsonString = sharedPreferences.getString(cachedCategory);
    if (jsonString != null) {
      return Future.value(CategoryModel(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveCategories(CategoryModel categoryToCache) {
    return sharedPreferences.setString(
      cachedCategory,
      json.encode(CategoryModel(categoryToCache)),
    );
  }
}
