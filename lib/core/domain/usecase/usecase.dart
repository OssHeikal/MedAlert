import 'package:dartz/dartz.dart';
import 'package:smart_pill/core/data/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}

abstract class Params {}
