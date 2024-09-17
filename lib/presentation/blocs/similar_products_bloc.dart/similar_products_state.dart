import 'package:equatable/equatable.dart';
import 'package:temry_market/data/models/product/similar_products_model.dart';

abstract class GetSimilarProductsState extends Equatable {
  const GetSimilarProductsState();

  @override
  List<Object> get props => [];
}

final class GetSimilarProductsInitial extends GetSimilarProductsState {}

final class GetSimilarProductsLoadingState extends GetSimilarProductsState {
  const GetSimilarProductsLoadingState();
}

final class GetSimilarProductsErrorState extends GetSimilarProductsState {
  final String errorMessage;

  const GetSimilarProductsErrorState({required this.errorMessage});
}

final class GetSimilarProductsSuccessState extends GetSimilarProductsState {
  final List<SimilarProductsModel> GetSimilarProducts;
  const GetSimilarProductsSuccessState(this.GetSimilarProducts);
}
