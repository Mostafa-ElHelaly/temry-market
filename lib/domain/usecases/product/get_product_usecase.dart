import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/data/models/category/category_model.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/domain/repositories/product_repository.dart';

class GetProductUseCase extends UseCase2<List<ProductModel>, NoParams> {
  final ProductRepository baseRepository;

  GetProductUseCase({required this.baseRepository});

  @override
  Future<Either<Failuremessage, List<ProductModel>>> call(
      NoParams params) async {
    final result = await baseRepository.getProducts();

    return result;
  }
}

class FilterProductParams {
  final String? keyword;
  final List<CategoryModel> categories;
  final double minPrice;
  final double maxPrice;
  final int? limit;
  final int? pageSize;

  const FilterProductParams({
    this.keyword = '',
    this.categories = const [],
    this.minPrice = 0,
    this.maxPrice = 10000,
    this.limit = 0,
    this.pageSize = 10,
  });

  FilterProductParams copyWith({
    int? skip,
    String? keyword,
    List<CategoryModel>? categories,
    double? minPrice,
    double? maxPrice,
    int? limit,
    int? pageSize,
  }) =>
      FilterProductParams(
        keyword: keyword ?? this.keyword,
        categories: categories ?? this.categories,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        limit: skip ?? this.limit,
        pageSize: pageSize ?? this.pageSize,
      );
}
