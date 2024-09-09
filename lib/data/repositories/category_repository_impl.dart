import 'package:dartz/dartz.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/data/data_sources/local/category_local_data_source.dart';
import 'package:temry_market/data/data_sources/remote/category_remote_data_source.dart';
import 'package:temry_market/data/models/category/category_model.dart';
import 'package:temry_market/domain/repositories/category_repository.dart';

class CategoriesRepositoryImp extends CategoriesBaseRepository {
  final CategoryRemotelyDateSource baseRemotelyDataSource;

  CategoriesRepositoryImp({
    required this.baseRemotelyDataSource,
  });

  @override
  Future<Either<Failuremessage, List<CategoryModel>>> getCategories() async {
    try {
      final result = await baseRemotelyDataSource.getCategories();
      return Right(result);
    } on Exception catch (e) {
      return Left(DioHelper.buildFailure(e));
    }
  }
}
