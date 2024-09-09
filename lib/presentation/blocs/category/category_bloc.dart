import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/data/models/category/category_model.dart';
import 'package:temry_market/presentation/blocs/category/category_event.dart';
import 'package:temry_market/presentation/blocs/category/category_state.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/entities/category/category.dart';
import '../../../domain/usecases/category/filter_category_usecase.dart';
import '../../../domain/usecases/category/get_cached_category_usecase.dart';
import '../../../domain/usecases/category/get_remote_category_usecase.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetRemoteCategoryUseCase CategoryUseCase;

  CategoryBloc({
    required this.CategoryUseCase,
  }) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      emit(const CategoryLoadingState());
      final result = await CategoryUseCase.call(NoParams());
      result.fold(
          (l) => emit(
              CategoryErrorState(failure: DioHelper().getTypeOfFailure(l))),
          (r) => emit(CategorySuccessState(r)));
    });
  }
}
