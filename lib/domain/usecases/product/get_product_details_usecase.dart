import 'package:dartz/dartz.dart';

import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/data/models/category/category_model.dart';
import 'package:temry_market/data/models/product/product_details_model.dart';
import 'package:temry_market/domain/repositories/product_repository.dart';

class GetProductDetailsUseCase extends UseCase3<ProductDetailsModel, int> {
  final ProductRepository baseRepository;

  GetProductDetailsUseCase({required this.baseRepository});

  @override
  Future<Either<String, ProductDetailsModel>> call(int course_id) async {
    final result = await baseRepository.getdetailsproducts(course_id);

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
