// import 'package:temry_market/domain/entities/product/pagination_meta_data.dart';
// import 'package:temry_market/domain/entities/product/product.dart';
// import 'package:temry_market/domain/entities/product/product_response.dart';
// import 'package:temry_market/data/models/product/pagination_data_model.dart';
// import 'package:temry_market/data/models/product/product_model.dart';
// import 'dart:convert';

// ProductModel productResponseModelFromJson(String str) =>
//     ProductModel.fromJson(json.decode(str));

// String productResponseModelToJson(ProductModel data) =>
//     json.encode(data.toJson());

// class ProductModel extends ProductResponse {
//   ProductModel({
//     required PaginationMetaData meta,
//     required List<Product> data,
//   }) : super(products: data, paginationMetaData: meta);

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         meta: PaginationMetaDataModel.fromJson(json["meta"]),
//         data: List<Product>.from(
//             json["data"].map((x) => ProductModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "meta": (paginationMetaData as PaginationMetaDataModel).toJson(),
//         "data": List<dynamic>.from(
//             (products as List<ProductModel>).map((x) => x.toJson())),
//       };
// }
