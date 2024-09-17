import 'package:dartz/dartz.dart';
import 'package:temry_market/data/models/Recipes/Recipes_model.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/repositories/respies_repository.dart';

class GetRemoteRecipesUseCase extends UseCase2<List<RecipesModel>, NoParams> {
  final RecipesBaseRepository repository;

  GetRemoteRecipesUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failuremessage, List<RecipesModel>>> call(
      NoParams params) async {
    final result = await repository.getRecipes();

    return result;
  }
}
