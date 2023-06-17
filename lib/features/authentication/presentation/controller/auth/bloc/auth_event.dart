part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthChecked extends AuthEvent {
  final User? user;

  const AuthChecked(this.user);

  @override
  List<Object> get props => user == null ? [] : [user!];
}

class UserProfileFetched extends AuthEvent {}

class AuthLogoutRequested extends AuthEvent {}
