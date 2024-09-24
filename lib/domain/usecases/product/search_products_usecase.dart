import 'package:dartz/dartz.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/domain/repositories/product_repository.dart';

class SearchProductsUsecase
    extends UseCase3<List<ProductModel>, SearchProductsModel> {
  final ProductRepository baseRepository;

  SearchProductsUsecase({required this.baseRepository});

  @override
  Future<Either<String, List<ProductModel>>> call(
      SearchProductsModel params) async {
    final result =
        await baseRepository.searchproducts(params.term, params.page);

    return result;
  }
}

class SearchProductsModel {
  final String? term;
  final int? page;

  SearchProductsModel({this.term, this.page});
}
