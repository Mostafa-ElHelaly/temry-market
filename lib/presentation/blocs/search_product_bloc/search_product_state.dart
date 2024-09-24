import 'package:equatable/equatable.dart';
import 'package:temry_market/data/models/product/product_model.dart';

abstract class SearchProductsState extends Equatable {
  const SearchProductsState();

  @override
  List<Object> get props => [];
}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsLoadingState extends SearchProductsState {
  const SearchProductsLoadingState();
}

final class SearchProductsErrorState extends SearchProductsState {
  final String errorMessage;

  const SearchProductsErrorState({required this.errorMessage});
}

final class SearchProductsSuccessState extends SearchProductsState {
  final List<ProductModel> SearchProducts;
  const SearchProductsSuccessState(this.SearchProducts);
}
