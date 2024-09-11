import 'package:dio/dio.dart';
import 'package:temry_market/core/constant/constant_api.dart';

import 'package:temry_market/data/models/product/product_model.dart';

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
        throw Exception('Getting search Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching search: $e');
    }
  }
}
