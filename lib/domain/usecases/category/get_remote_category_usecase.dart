import 'package:dartz/dartz.dart';
import 'package:temry_market/data/models/category/category_model.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/repositories/category_repository.dart';

class GetRemoteCategoryUseCase extends UseCase2<List<CategoryModel>, NoParams> {
  final CategoriesBaseRepository repository;

  GetRemoteCategoryUseCase({required this.repository});

  @override
  Future<Either<Failuremessage, List<CategoryModel>>> call(
      NoParams params) async {
    final result = await repository.getCategories();

    return result;
  }
}
