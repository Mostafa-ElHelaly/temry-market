import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:temry_market/core/error/exceptions.dart';
import 'package:temry_market/data/models/recipes/recipes_model.dart';

abstract class RecpiesLocalDataSource {
  Future<RecipesModel> getRecipes();
  Future<void> saveRecipes(RecipesModel productsToCache);
}

const cachedRecipes = 'CACHED_CATEGORIES';

class RecipesLocalDataSourceImpl implements RecpiesLocalDataSource {
  final SharedPreferences sharedPreferences;
  RecipesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<RecipesModel> getRecipes() {
    final jsonString = sharedPreferences.getString(cachedRecipes);
    if (jsonString != null) {
      return Future.value(RecipesModel(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveRecipes(RecipesModel RecipesToCache) {
    return sharedPreferences.setString(
      cachedRecipes,
      json.encode(RecipesModel(RecipesToCache)),
    );
  }
}
