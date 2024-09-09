import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/data/models/category/category_model.dart';

abstract class CategoriesBaseRepository {
  Future<Either<Failuremessage, List<CategoryModel>>> getCategories();
}
