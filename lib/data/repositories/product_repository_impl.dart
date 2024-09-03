import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/error/exceptions.dart';
import 'package:temry_market/core/network/network_info.dart';
import 'package:temry_market/domain/entities/product/product_response.dart';
import 'package:temry_market/domain/repositories/product_repository.dart';
import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';
import 'package:temry_market/data/data_sources/local/product_local_data_source.dart';
import 'package:temry_market/data/data_sources/remote/product_remote_data_source.dart';
import 'package:temry_market/data/models/product/product_response_model.dart';

typedef _ConcreteOrProductChooser = Future<ProductResponse> Function();

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductResponse>> getProducts(
      FilterProductParams params) async {
    return await _getProduct(() {
      return remoteDataSource.getProducts(params);
    });
  }

  Future<Either<Failure, ProductResponse>> _getProduct(
    _ConcreteOrProductChooser getConcreteOrProducts,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await getConcreteOrProducts();
        localDataSource.saveProducts(remoteProducts as ProductResponseModel);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getLastProducts();
        return Right(localProducts);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
