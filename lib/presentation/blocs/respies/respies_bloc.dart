import 'package:bloc/bloc.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/domain/usecases/respies/get_remote_respies_usecase.dart';
import 'package:temry_market/presentation/blocs/respies/respies_event.dart';
import 'package:temry_market/presentation/blocs/respies/respies_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  GetRemoteRecipesUseCase recipesUseCase;

  RecipesBloc({
    required this.recipesUseCase,
  }) : super(RecipesInitial()) {
    on<RecipesEvent>((event, emit) async {
      emit(const RecipesLoadingState());
      final result = await recipesUseCase.call(NoParams());
      result.fold(
          (l) =>
              emit(RecipesErrorState(failure: DioHelper().getTypeOfFailure(l))),
          (r) => emit(RecipesSuccessState(r)));
    });
  }
}
