import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/data/models/product/product_details_model.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/data/models/product/similar_products_model.dart';
import 'package:temry_market/domain/repositories/product_repository.dart';
import 'package:temry_market/data/data_sources/remote/product_remote_data_source.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final result = await remoteDataSource.getProducts();
      return Right(result);
    } on Exception catch (e) {
      print(DioHelper.buildFailure(e).errorMessage);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<Failuremessage, List<SimilarProductsModel>>> getSimilarProducts(
      int product_id) async {
    try {
      final result = await remoteDataSource.getsimilarProducts(product_id);
      return Right(result);
    } on Exception catch (e) {
      return Left(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> searchproducts(
      String? term, int? page) async {
    try {
      final result = await remoteDataSource.searchproducts(term, page);
      return Right(result);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductDetailsModel>>> getdetailsproducts() async {
    try {
      final result = await remoteDataSource.getdetailsproducts();
      return Right(result);
    } on Exception catch (e) {
      print(DioHelper.buildFailure(e).errorMessage);
      return Left(e.toString());
    }
  }
}
  // @override
  // Future<Either<List<ProductModel>, Failure>> getProducts() async {
  //   try {
  //     final result = await remoteDataSource.getProducts();
  //     return Left(result);
  //   } on Exception catch (e) {
  //     return right(DioHelper.buildFailure(e));
  //   }
  // }

