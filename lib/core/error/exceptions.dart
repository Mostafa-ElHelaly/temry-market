//date
class ServerException implements Exception {}

class CacheException implements Exception {}

//route
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}

class ErrorModelException implements Exception {
  final String errorMessage;

  ErrorModelException({required this.errorMessage});

  factory ErrorModelException.fromJson(Map<String, dynamic> json) {
    return ErrorModelException(errorMessage: json['message']);
  }
}

class ConnectionTimeoutException implements Exception {}

class UnauthorizedException implements Exception {}

class InternetException implements Exception {}

class SignupException implements Exception {}
