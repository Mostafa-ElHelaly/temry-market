import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:temry_market/core/constant/constant_api.dart';

import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/data/models/product/similar_products_model.dart';

// abstract class ProductRemoteDataSource {
//   Future<ProductResponseModel> getProducts(FilterProductParams params);
// }

// class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
//   final http.Client client;
//   ProductRemoteDataSourceImpl({required this.client});

//   @override
//   Future<ProductResponseModel> getProducts(params) =>
//       _getProductFromUrl('$baseUrl/public/products}');

//   Future<ProductResponseModel> _getProductFromUrl(String url) async {
//     final response = await client.post(Uri.parse(ConstantApi.products),
//         headers: {
//           'Content-Type': "application/x-www-form-urlencoded",
//         },
//         body: body);

//     final response = await client.get(
//       Uri.parse(url),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//     );
//     if (response.statusCode == 200) {
//       return productResponseModelFromJson(response.body);
//     } else {
//       throw ServerException();
//     }
//   }
// }

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<SimilarProductsModel>> getsimilarProducts(int product_id);
  Future<List<ProductModel>> searchproducts(String? term, int? page);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      Response response = await dio.get(ConstantApi.products);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> searchJson = jsonResponse['data'];

        // Convert JSON list to List<CountriesModel>
        List<ProductModel> search = searchJson.map((json) {
          return ProductModel.fromJson(json);
        }).toList();
        print(response.data['data']);
        // save_products(search);
        return search;
      } else {
        // Error: Parse the error message from the response
        String errorMessage = _getErrorMessage(response);
        print('Error: $errorMessage');
        throw Exception('Getting products Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Getting products Failed: ${e.toString()}');
    }
  }

  String _getErrorMessage(Response<dynamic> response) {
    try {
      final Map<String, dynamic> errorData = json.decode(response.data);
      // Assuming the API returns an error message in the format: { "error": "Error message here" }
      return errorData['error'] ?? 'Unknown error occurred';
    } catch (e) {
      return 'Failed to parse error message';
    }
  }

  @override
  Future<List<SimilarProductsModel>> getsimilarProducts(int product_id) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response =
          await dio.get(ConstantApi.similarproducts + product_id.toString());

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> sililarProductsJson = jsonResponse['data'];
        List<SimilarProductsModel> similarProducts =
            sililarProductsJson.map((json) {
          return SimilarProductsModel.fromJson(json);
        }).toList();
        print(jsonResponse['data']);
        return similarProducts;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  @override
  Future<List<ProductModel>> searchproducts(String? term, int? page) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(
          ConstantApi.searchproducts + "?term=${term ?? ''}&page=${page ?? 0}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> searchProductsJson =
            jsonResponse['data']['products'];
        List<ProductModel> searchProducts = searchProductsJson.map((json) {
          return ProductModel.fromJson(json);
        }).toList();
        print(jsonResponse['data']);
        return searchProducts;
      } else {
        throw Exception('Getting Countries Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
