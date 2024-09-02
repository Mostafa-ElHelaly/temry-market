import 'package:dartz/dartz.dart';
import 'package:temry_market/domain/usecases/user/forget_password_usecase.dart';

import '../../../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user/user.dart';
import '../usecases/user/sign_in_usecase.dart';
import '../usecases/user/sign_up_usecase.dart';

abstract class UserRepository {
  Future<Either<Failure, Map<String, dynamic>>> signIn(SignInParams params);
  Future<Either<Failure, Unit>> signUp(SignUpParams params);
  Future<Either<Failure, NoParams>> signOut();
  Future<Either<Failure, User>> getCachedUser();
  Future<Either<Failure, Unit>> forgetpassword(ForgetPasswordParams params);
}
