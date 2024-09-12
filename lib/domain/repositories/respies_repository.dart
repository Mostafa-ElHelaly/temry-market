import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/data/models/Recipes/Recipes_model.dart';

abstract class RecipesBaseRepository {
  Future<Either<Failuremessage, List<RecipesModel>>> getRecipes();
}
