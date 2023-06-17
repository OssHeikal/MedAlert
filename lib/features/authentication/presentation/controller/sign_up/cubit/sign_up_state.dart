part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.status = AuthStatus.initial,
    this.isPasswordVisible = true,
    this.message = '',
  });
  final AuthStatus status;
  final bool isPasswordVisible;
  final String message;

  SignUpState copyWith({
    AuthStatus? status,
    bool? isPasswordVisible,
    String? message,
  }) {
    return SignUpState(
      status: status ?? this.status,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, isPasswordVisible, message];
}
