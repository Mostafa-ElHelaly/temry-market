import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/domain/repositories/product_repository.dart';
import 'package:temry_market/data/data_sources/remote/product_remote_data_source.dart';

// typedef _ConcreteOrProductChooser = Future<ProductModel> Function();

// class ProductRepositoryImpl implements ProductRepository {
//   final ProductRemoteDataSource remoteDataSource;
//   final ProductLocalDataSource localDataSource;
//   final NetworkInfo networkInfo;

//   ProductRepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     required this.networkInfo,
//   });

//   @override
//   Future<Either<Failure, ProductModel>> getProducts(
//       FilterProductParams params) async {
//     return await _getProduct(() {
//       return remoteDataSource.getProducts(params);
//     });
//   }

//   Future<Either<Failure, ProductResponse>> _getProduct(
//     _ConcreteOrProductChooser getConcreteOrProducts,
//   ) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteProducts = await getConcreteOrProducts();
//         localDataSource.saveProducts(remoteProducts as ProductModel);
//         return Right(remoteProducts);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       try {
//         final localProducts = await localDataSource.getLastProducts();
//         return Right(localProducts);
//       } on CacheException {
//         return Left(CacheFailure());
//       }
//     }
//   }
// }

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failuremessage, List<ProductModel>>> getProducts() async {
    try {
      final result = await remoteDataSource.getProducts();
      return Right(result);
    } on Exception catch (e) {
      return Left(DioHelper.buildFailure(e));
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

