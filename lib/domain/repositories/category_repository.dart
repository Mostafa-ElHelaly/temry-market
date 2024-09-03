import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/domain/entities/category/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getRemoteCategories();
  Future<Either<Failure, List<Category>>> getCachedCategories();
  Future<Either<Failure, List<Category>>> filterCachedCategories(
      String keyword);
}
