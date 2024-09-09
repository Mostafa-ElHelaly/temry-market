import 'package:equatable/equatable.dart';
import 'package:temry_market/data/models/category/category_model.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingState extends CategoryState {
  const CategoryLoadingState();
}

final class CategoryErrorState extends CategoryState {
  final String failure;

  const CategoryErrorState({required this.failure});
}

final class CategorySuccessState extends CategoryState {
  final List<CategoryModel> searchList;
  const CategorySuccessState(this.searchList);
}
