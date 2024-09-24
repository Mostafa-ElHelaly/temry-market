import 'package:bloc/bloc.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/domain/usecases/product/search_products_usecase.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_event.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_state.dart';
import 'package:temry_market/presentation/blocs/similar_products_bloc.dart/similar_products_event.dart';
import 'package:temry_market/presentation/blocs/similar_products_bloc.dart/similar_products_state.dart';

class SearchProductsBloc
    extends Bloc<SearchAllProductsEvent, SearchProductsState> {
  SearchProductsUsecase searchProductsUsecase;

  SearchProductsBloc({required this.searchProductsUsecase})
      : super(SearchProductsInitial()) {
    on<SearchAllProductsEvent>((event, emit) async {
      emit(const SearchProductsLoadingState());
      final result = await searchProductsUsecase.call(SearchProductsModel(
        term: event.term,
        page: event.page,
      ));
      result.fold((l) => emit(SearchProductsErrorState(errorMessage: l)),
          (r) => emit(SearchProductsSuccessState(r)));
    });
  }
}
