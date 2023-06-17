import 'package:dartz/dartz.dart';
import 'package:smart_pill/core/data/error/failure.dart';
import 'package:smart_pill/core/domain/usecase/usecase.dart';
import 'package:smart_pill/features/authentication/domain/entities/user_profile.dart';
import 'package:smart_pill/features/authentication/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<Unit, UserProfile> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UserProfile params) async {
    return await repository.signInWithEmailAndPassword(params);
  }
}
