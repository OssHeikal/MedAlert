import 'package:dartz/dartz.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/domain/repositories/medicine_repository.dart';

class AddDispenserToRealTimeDBUseCase {
  final MedicineRepository repository;

  AddDispenserToRealTimeDBUseCase(this.repository);

  Future<Unit> call(Dispenser dispenser) async {
    await repository.addDispenserToRealTimeDatabase(dispenser);
    return unit;
  }
}
