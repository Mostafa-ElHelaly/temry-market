import 'package:equatable/equatable.dart';
import 'package:temry_market/data/models/product/product_details_model.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoadingState extends ProductDetailsState {
  const ProductDetailsLoadingState();
}

final class ProductDetailsErrorState extends ProductDetailsState {
  final String failure;

  const ProductDetailsErrorState({required this.failure});
}

final class ProductDetailsSuccessState extends ProductDetailsState {
  final ProductDetailsModel productsdetails;
  const ProductDetailsSuccessState(this.productsdetails);
}
