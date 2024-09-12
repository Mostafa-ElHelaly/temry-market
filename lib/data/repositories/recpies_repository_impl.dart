import 'package:dartz/dartz.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/data/data_sources/remote/recpies_remote_data_source.dart';
import 'package:temry_market/data/models/Recipes/Recipes_model.dart';
import 'package:temry_market/domain/repositories/respies_repository.dart';

class RecipesRepositoryImp extends RecipesBaseRepository {
  final RecipesRemotelyDateSource baseRemotelyDataSource;

  RecipesRepositoryImp({
    required this.baseRemotelyDataSource,
  });

  @override
  Future<Either<Failuremessage, List<RecipesModel>>> getRecipes() async {
    try {
      final result = await baseRemotelyDataSource.getRecipes();
      return Right(result);
    } on Exception catch (e) {
      return Left(DioHelper.buildFailure(e));
    }
  }
}
