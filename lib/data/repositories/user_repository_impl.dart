import 'package:dartz/dartz.dart';
import 'package:temry_market/core/usecases/usecase.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/network/network_info.dart';
import 'package:temry_market/domain/entities/user/user.dart';
import 'package:temry_market/domain/repositories/user_repository.dart';
import 'package:temry_market/data/data_sources/local/user_local_data_source.dart';
import 'package:temry_market/data/data_sources/remote/user_remote_data_source.dart';
import 'package:temry_market/data/models/user/authentication_response_model.dart';

typedef _DataSourceChooser = Future<AuthenticationResponseModel> Function();

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Map<String, dynamic>>> signIn(params) async {
    try {
      final result = await remoteDataSource.signIn(params);
      return Right(result);
    } on Exception {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(params) async {
    try {
      final result = await remoteDataSource.signUp(params);
      return Right(result);
    } on Exception {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetpassword(params) async {
    try {
      final result = await remoteDataSource.forgetpassword(params);
      return Right(result);
    } on Exception {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getCachedUser() async {
    try {
      final user = await localDataSource.getUser();
      return Right(user);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> signOut() async {
    try {
      await localDataSource.clearCache();
      return Right(NoParams());
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, User>> _authenticate(
    _DataSourceChooser getDataSource,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        localDataSource.saveToken(remoteResponse.token);
        localDataSource.saveUser(remoteResponse.user);
        return Right(remoteResponse.user);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
