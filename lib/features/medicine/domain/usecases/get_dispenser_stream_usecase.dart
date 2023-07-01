import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/domain/repositories/medicine_repository.dart';

class GetDispenserStreamUseCase {
  final MedicineRepository repository;

  GetDispenserStreamUseCase(this.repository);

  Stream<List<Dispenser>> call(String patientId) {
    return repository.getDispensersStream(patientId);
  }
}
