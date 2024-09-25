import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:temry_market/core/constant/constant_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:temry_market/data/models/category/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemotelyDateSource extends CategoryLocalDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.categories);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> categoriesJson = jsonResponse['data'];
        List<CategoryModel> categories = categoriesJson.map((json) {
          return CategoryModel.fromJson(json);
        }).toList();
        print(jsonResponse['data']);
        // save_categories(categories);
        return categories;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  // Future<void> save_categories(List<CategoryModel> trainers) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String data = json.encode(trainers.map((e) => e.toJson()).toList());
  //   await prefs.setString('categories_info', data);
  // }

  // @override
  // Future<List<CategoryModel>> getCategories() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? data = prefs.getString('categories_info');
  //   if (data != null) {
  //     Iterable<dynamic> decodeddata = json.decode(data);
  //     return decodeddata.map((e) => CategoryModel.fromJson(e)).toList();
  //   } else {
  //     return await unsavedcategories();
  //   }
  // }
}
