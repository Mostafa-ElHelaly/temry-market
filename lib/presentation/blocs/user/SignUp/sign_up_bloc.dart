import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/domain/usecases/user/sign_up_usecase.dart';
import 'package:temry_market/presentation/blocs/user/SignUp/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpParams, SignUPState> {
  SignUpUseCase registerUseCase;

  SignUpBloc({required this.registerUseCase}) : super(SignUPInitial()) {
    on<SignUpParams>((event, emit) async {
      emit(const SignUPLoadingState());
      final result = await registerUseCase.call(event);
      result.fold((l) => emit(SignUPErrorState(failure: l)),
          (r) => emit(SignUPSuccessState(SignUPModelResponse: r)));
    });
  }
}
