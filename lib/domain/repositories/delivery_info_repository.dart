import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/data/models/user/delivery_info_model.dart';
import 'package:temry_market/domain/entities/user/delivery_info.dart';

abstract class DeliveryInfoRepository {
  Future<Either<Failure, List<DeliveryInfo>>> getRemoteDeliveryInfo();
  Future<Either<Failure, List<DeliveryInfo>>> getCachedDeliveryInfo();
  Future<Either<Failure, DeliveryInfo>> addDeliveryInfo(
      DeliveryInfoModel param);
  Future<Either<Failure, DeliveryInfo>> editDeliveryInfo(
      DeliveryInfoModel param);
  Future<Either<Failure, DeliveryInfo>> selectDeliveryInfo(DeliveryInfo param);
  Future<Either<Failure, DeliveryInfo>> getSelectedDeliveryInfo();
  Future<Either<Failure, NoParams>> clearLocalDeliveryInfo();
}
