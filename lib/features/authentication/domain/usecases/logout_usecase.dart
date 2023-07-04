import 'package:dartz/dartz.dart';
import 'package:med_alert/core/data/error/failure.dart';
import 'package:med_alert/core/domain/usecase/usecase.dart';
import 'package:med_alert/features/authentication/domain/repositories/auth_repository.dart';

class LogoutUseCase extends UseCase<Unit, NoParams> {
  LogoutUseCase(this.repository);
  final AuthRepository repository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.signOut();
  }
}
