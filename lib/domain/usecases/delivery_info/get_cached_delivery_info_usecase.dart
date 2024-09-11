import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/entities/user/delivery_info.dart';
import 'package:temry_market/domain/repositories/delivery_info_repository.dart';

class GetCachedDeliveryInfoUseCase
    implements UseCase<List<DeliveryInfo>, NoParams> {
  final DeliveryInfoRepository repository;
  GetCachedDeliveryInfoUseCase(this.repository);

  @override
  Future<Either<Failure, List<DeliveryInfo>>> call(NoParams params) async {
    return await repository.getCachedDeliveryInfo();
  }
}
