import 'package:dartz/dartz.dart';
import 'package:temry_market/core/usecases/usecase.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/network/network_info.dart';
import 'package:temry_market/domain/entities/order/order_details.dart';
import 'package:temry_market/domain/repositories/order_repository.dart';
import 'package:temry_market/data/data_sources/local/order_local_data_source.dart';
import 'package:temry_market/data/data_sources/local/user_local_data_source.dart';
import 'package:temry_market/data/data_sources/remote/order_remote_data_source.dart';
import 'package:temry_market/data/models/order/order_details_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  final OrderLocalDataSource localDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  OrderRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.userLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, OrderDetails>> addOrder(OrderDetails params) async {
    if (await userLocalDataSource.isTokenAvailable()) {
      final String token = await userLocalDataSource.getToken();
      final remoteProduct = await remoteDataSource.addOrder(
        OrderDetailsModel.fromEntity(params),
        token,
      );
      return Right(remoteProduct);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderDetails>>> getRemoteOrders() async {
    if (await networkInfo.isConnected) {
      if (await userLocalDataSource.isTokenAvailable()) {
        try {
          final String token = await userLocalDataSource.getToken();
          final remoteProduct = await remoteDataSource.getOrders(
            token,
          );
          await localDataSource.saveOrders(remoteProduct);
          return Right(remoteProduct);
        } on Failure catch (failure) {
          return Left(failure);
        }
      } else {
        return Left(AuthenticationFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderDetails>>> getCachedOrders() async {
    try {
      final localOrders = await localDataSource.getOrders();
      return Right(localOrders);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, NoParams>> clearLocalOrders() async {
    try {
      await localDataSource.clearOrder();
      return Right(NoParams());
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
