import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:temry_market/core/constant/constant_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:temry_market/data/models/Recipes/Recipes_model.dart';

abstract class RecipesRemoteDataSource {
  Future<List<RecipesModel>> getRecipes();
}

class RecipesRemotelyDateSource extends RecipesRemoteDataSource {
  @override
  Future<List<RecipesModel>> unsavedrespies() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.recipes);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> recipesJson = jsonResponse['data'];
        List<RecipesModel> recipes = recipesJson.map((json) {
          return RecipesModel.fromJson(json);
        }).toList();
        print(jsonResponse['data']);
        print('-------------------------------------------------');
        save_recipes(recipes);
        return recipes;
      } else {
        throw Exception('Getting recipes Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  Future<void> save_recipes(List<RecipesModel> trainers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = json.encode(trainers.map((e) => e.toJson()).toList());
    await prefs.setString('recipes_info', data);
  }

  @override
  Future<List<RecipesModel>> getRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('recipes_info');
    if (data != null) {
      Iterable<dynamic> decodeddata = json.decode(data);
      return decodeddata.map((e) => RecipesModel.fromJson(e)).toList();
    } else {
      return await unsavedrespies();
    }
  }
}
