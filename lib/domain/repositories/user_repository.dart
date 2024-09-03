import 'package:dartz/dartz.dart';
import 'package:temry_market/domain/usecases/user/forget_password_usecase.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/usecases/usecase.dart';
import 'package:temry_market/domain/entities/user/user.dart';
import 'package:temry_market/domain/usecases/user/sign_in_usecase.dart';
import 'package:temry_market/domain/usecases/user/sign_up_usecase.dart';

abstract class UserRepository {
  Future<Either<Failure, Map<String, dynamic>>> signIn(SignInParams params);
  Future<Either<Failure, Unit>> signUp(SignUpParams params);
  Future<Either<Failure, NoParams>> signOut();
  Future<Either<Failure, User>> getCachedUser();
  Future<Either<Failure, Unit>> forgetpassword(ForgetPasswordParams params);
}
