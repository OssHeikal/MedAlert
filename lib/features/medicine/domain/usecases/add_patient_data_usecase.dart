import 'package:dartz/dartz.dart';
import 'package:smart_pill/core/data/error/failure.dart';
import 'package:smart_pill/core/domain/usecase/usecase.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/domain/repositories/medicine_repository.dart';

class AddPatientDataUseCase extends UseCase<Unit, Dispenser> {
  final MedicineRepository repository;

  AddPatientDataUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(Dispenser params) async {
    return await repository.addDispenser(params);
  }
}
