import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/repositories/user_repository.dart';

class SignUpUseCase implements UseCase<Unit, SignUpParams> {
  final UserRepository repository;
  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SignUpParams params) async {
    return await repository.signUp(params);
  }
}

//signup
class SignUpParams {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String password;
  const SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.password,
  });
}
