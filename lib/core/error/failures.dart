import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class Failuremessage {
  final String? errorMessage;

  Failuremessage({this.errorMessage});
}

class ErrorMessageFailure extends Failuremessage {
  ErrorMessageFailure({required String message}) : super(errorMessage: message);
}

// General failures
class ServerFailure extends Failuremessage {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ExceptionFailure extends Failure {}

class CredentialFailure extends Failure {}

class AuthenticationFailure extends Failuremessage {}

class AuthenticationFailure2 extends Failure {}

class UnauthorizedFailure extends Failuremessage {}

class InternetFailure extends Failuremessage {}
