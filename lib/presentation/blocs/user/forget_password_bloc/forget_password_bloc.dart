import 'package:bloc/bloc.dart';
import 'package:temry_market/domain/usecases/user/forget_password_usecase.dart';
import 'package:temry_market/presentation/blocs/user/forget_password_bloc/forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordParams, ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordBloc({required this.forgetPasswordUseCase})
      : super(ForgetPasswordInitial()) {
    on<ForgetPasswordParams>((event, emit) async {
      emit(const ForgetPasswordLoadingState());
      final result = await forgetPasswordUseCase.call(event);
      result.fold(
          (l) => emit(ForgetPasswordErrorState(
                failure: l,
              )),
          (r) =>
              emit(ForgetPasswordSuccessState(ForgetPasswordModelResponse: r)));
    });
  }
}
