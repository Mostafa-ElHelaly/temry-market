import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/entities/cart/cart_item.dart';
import 'package:temry_market/domain/repositories/cart_repository.dart';

class SyncCartUseCase implements UseCase<List<CartItem>, NoParams> {
  final CartRepository repository;
  SyncCartUseCase(this.repository);

  @override
  Future<Either<Failure, List<CartItem>>> call(NoParams params) async {
    return await repository.syncCart();
  }
}
