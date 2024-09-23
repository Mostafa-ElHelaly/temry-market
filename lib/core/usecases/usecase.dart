import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:temry_market/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCase2<Type, Params> {
  Future<Either<Failuremessage, Type>> call(Params params);
}

abstract class UseCase3<Type, Params> {
  Future<Either<String, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
