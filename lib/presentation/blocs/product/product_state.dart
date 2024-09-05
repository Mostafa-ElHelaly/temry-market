import 'package:equatable/equatable.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/data/models/product/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {
  const ProductLoadingState();
}

final class ProductErrorState extends ProductState {
  final String failure;

  const ProductErrorState({required this.failure});
}

final class ProductSuccessState extends ProductState {
  final List<ProductModel> searchList;
  const ProductSuccessState(this.searchList);
}
