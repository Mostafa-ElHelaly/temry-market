import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/data/models/product/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failuremessage, List<ProductModel>>> getProducts();
}
