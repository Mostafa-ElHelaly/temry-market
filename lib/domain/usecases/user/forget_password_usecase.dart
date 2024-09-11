import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/repositories/user_repository.dart';

class ForgetPasswordUseCase implements UseCase<Unit, ForgetPasswordParams> {
  final UserRepository repository;
  ForgetPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ForgetPasswordParams params) async {
    return await repository.forgetpassword(params);
  }
}

class ForgetPasswordParams {
  final String email;
  const ForgetPasswordParams({
    required this.email,
  });
}
