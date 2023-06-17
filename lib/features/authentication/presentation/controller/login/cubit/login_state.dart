part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = AuthStatus.initial,
    this.isPasswordVisible = true,
    this.message = '',
  });
  final AuthStatus status;
  final bool isPasswordVisible;
  final String message;

  LoginState copyWith({
    AuthStatus? status,
    bool? isPasswordVisible,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, isPasswordVisible, message];
}
