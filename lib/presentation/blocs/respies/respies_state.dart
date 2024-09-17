import 'package:equatable/equatable.dart';
import 'package:temry_market/data/models/Recipes/Recipes_model.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

final class RecipesInitial extends RecipesState {}

final class RecipesLoadingState extends RecipesState {
  const RecipesLoadingState();
}

final class RecipesErrorState extends RecipesState {
  final String failure;

  const RecipesErrorState({required this.failure});
}

final class RecipesSuccessState extends RecipesState {
  final List<RecipesModel> searchList;
  const RecipesSuccessState(this.searchList);
}
