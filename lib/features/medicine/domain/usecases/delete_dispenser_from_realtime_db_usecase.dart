import 'package:dartz/dartz.dart';
import 'package:smart_pill/features/medicine/domain/repositories/medicine_repository.dart';

class DeleteDispenserFromRealtimeDBUseCase {
  final MedicineRepository repository;

  DeleteDispenserFromRealtimeDBUseCase(this.repository);

  Future<Unit> call(String params) async {
    await repository.deleteDispenserToRealTimeDatabase(params);
    return unit;
  }
}
