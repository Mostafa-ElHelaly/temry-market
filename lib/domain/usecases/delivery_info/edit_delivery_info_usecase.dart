import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/data/models/user/delivery_info_model.dart';
import 'package:temry_market/domain/entities/user/delivery_info.dart';
import 'package:temry_market/domain/repositories/delivery_info_repository.dart';

class EditDeliveryInfoUseCase
    implements UseCase<DeliveryInfo, DeliveryInfoModel> {
  final DeliveryInfoRepository repository;
  EditDeliveryInfoUseCase(this.repository);

  @override
  Future<Either<Failure, DeliveryInfo>> call(DeliveryInfoModel params) async {
    return await repository.editDeliveryInfo(params);
  }
}
