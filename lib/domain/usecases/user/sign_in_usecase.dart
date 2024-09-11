import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/repositories/user_repository.dart';

class SignINUseCase implements UseCase<Map<String, dynamic>, SignInParams> {
  final UserRepository repository;
  SignINUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      SignInParams params) async {
    return await repository.signIn(params);
  }
}

class SignInParams {
  final String email;
  final String password;
  const SignInParams({
    required this.email,
    required this.password,
  });
}
