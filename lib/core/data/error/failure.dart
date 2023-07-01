abstract class Failure {
  final String? message;

  Failure({this.message});
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({String? message}) : super(message: message);
}

class NetworkFailure extends Failure {
  NetworkFailure({String? message}) : super(message: message);
}

class ServerFailure extends Failure {
  ServerFailure({String? message}) : super(message: message);
}

class UnexpectedFailure extends Failure {}

class NotificationFailure extends Failure {}
