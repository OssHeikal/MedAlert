import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  const UserProfile({
    this.id,
    this.email,
    this.password,
    this.username,
  });
  final String? id;
  final String? email;
  final String? password;
  final String? username;

  const UserProfile.empty()
      : id = '',
        username = '',
        password = '',
        email = '';

  @override
  List<Object?> get props => [
        id,
        email,
        password,
        username,
      ];
}
