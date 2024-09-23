import 'package:bloc/bloc.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/core/util/Dio_helper.dart';
import 'package:temry_market/presentation/blocs/product/product_event.dart';
import 'package:temry_market/presentation/blocs/product/product_state.dart';

import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductUseCase productUseCase;

  ProductBloc({
    required this.productUseCase,
  }) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(const ProductLoadingState());
      final result = await productUseCase.call(NoParams());
      result.fold((l) => emit(ProductErrorState(failure: l.toString())),
          (r) => emit(ProductSuccessState(r)));
    });
  }
}
