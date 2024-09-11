import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/repositories/order_repository.dart';

class ClearLocalOrdersUseCase implements UseCase<NoParams, NoParams> {
  final OrderRepository repository;
  ClearLocalOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async {
    return await repository.clearLocalOrders();
  }
}
