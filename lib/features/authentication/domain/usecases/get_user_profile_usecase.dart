import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_pill/features/authentication/domain/repositories/auth_repository.dart';

class GetUserProfileUseCase {
  final AuthRepository repository;

  GetUserProfileUseCase(this.repository);

  User? call() {
    return repository.getUserProfile();
  }
}
