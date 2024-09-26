import 'package:bloc/bloc.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/usecases/product/get_product_details_usecase.dart';

import 'package:temry_market/presentation/blocs/product_Details/product_details_event.dart';
import 'package:temry_market/presentation/blocs/product_Details/product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  GetProductDetailsUseCase productdetailsUseCase;

  ProductDetailsBloc({
    required this.productdetailsUseCase,
  }) : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) async {
      emit(const ProductDetailsLoadingState());
      final result = await productdetailsUseCase.call(event.product_id);
      result.fold((l) => emit(ProductDetailsErrorState(failure: l.toString())),
          (r) => emit(ProductDetailsSuccessState(r)));
    });
  }
}
