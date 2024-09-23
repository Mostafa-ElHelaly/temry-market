import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/data/models/product/similar_products_model.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<Failuremessage, List<SimilarProductsModel>>> getSimilarProducts(
      int product_id);
}
