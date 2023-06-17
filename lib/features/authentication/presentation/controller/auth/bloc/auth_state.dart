part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = AppStatus.unauthenticated,
    this.user = const UserProfile.empty(),
  });
  final AppStatus status;
  final UserProfile user;

  AuthState copyWith({
    AppStatus? status,
    UserProfile? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, user];
}
