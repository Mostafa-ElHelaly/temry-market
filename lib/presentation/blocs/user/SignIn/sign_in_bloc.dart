import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/domain/usecases/user/sign_in_usecase.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_state.dart';

class SignInBloc extends Bloc<SignInParams, SignInState> {
  SignINUseCase SignInUseCase;

  SignInBloc({required this.SignInUseCase}) : super(SignInInitial()) {
    on<SignInParams>((event, emit) async {
      emit(const SignInLoadingState());
      final result = await SignInUseCase.call(event);
      result.fold((l) => emit(SignInErrorState(failure: l)),
          (r) => emit(SignInSuccessState(SignInModelResponse: r)));
    });
  }
}
