import 'package:dartz/dartz.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/data/models/product/similar_products_model.dart';
import 'package:temry_market/domain/repositories/product_repository.dart';

class GetSimilarProductsUsecase
    extends UseCase2<List<SimilarProductsModel>, int> {
  final ProductRepository baseRepository;

  GetSimilarProductsUsecase({required this.baseRepository});

  @override
  Future<Either<Failuremessage, List<SimilarProductsModel>>> call(
      int course_id) async {
    final result = await baseRepository.getSimilarProducts(course_id);

    return result;
  }
}
