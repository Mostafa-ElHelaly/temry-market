import 'package:bloc/bloc.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/domain/usecases/product/get_similar_products_usecase.dart';
import 'package:temry_market/presentation/blocs/similar_products_bloc.dart/similar_products_event.dart';
import 'package:temry_market/presentation/blocs/similar_products_bloc.dart/similar_products_state.dart';

class GetSimilarProductsBloc
    extends Bloc<GetSimilarProductsEvent, GetSimilarProductsState> {
  GetSimilarProductsUsecase getsilmilarsUseCase;

  GetSimilarProductsBloc({required this.getsilmilarsUseCase})
      : super(GetSimilarProductsInitial()) {
    on<GetSimilarProductsEvent>((event, emit) async {
      emit(const GetSimilarProductsLoadingState());
      final result = await getsilmilarsUseCase.call(event.product_id);
      result.fold(
          (l) => emit(GetSimilarProductsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(l))),
          (r) => emit(GetSimilarProductsSuccessState(r)));
    });
  }
}
