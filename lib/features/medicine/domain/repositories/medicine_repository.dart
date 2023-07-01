import 'package:dartz/dartz.dart';
import 'package:smart_pill/core/data/error/failure.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';

abstract class MedicineRepository {
  Future<Either<Failure, Unit>> addDispenser(Dispenser dispenser);
  Future<Either<Failure, Unit>> deleteDispenser(String dispenserId);
  Stream<List<Dispenser>> getDispensersStream(String patientId);
  Future<Either<Failure, Unit>> addDispenserToRealTimeDatabase(
      Dispenser dispenser);
  Future<Either<Failure, Unit>> deleteDispenserToRealTimeDatabase(
      String dispenserIndex);
}
