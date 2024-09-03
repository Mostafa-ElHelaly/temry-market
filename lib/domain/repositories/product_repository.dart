import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/domain/entities/product/product_response.dart';
import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponse>> getProducts(
      FilterProductParams params);
}
