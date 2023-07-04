import 'package:dartz/dartz.dart';
import 'package:med_alert/core/data/error/failure.dart';
import 'package:med_alert/features/medicine/domain/entities/medicine_schedule.dart';

abstract class MedicineRepository {
  Future<Either<Failure, Unit>> addMedicineSchedule(MedicineSchedule dispenser);
  Future<Either<Failure, Unit>> deleteMedicineSchedule(String dispenserId);
  Stream<List<MedicineSchedule>> getAllMedicinesStream(String patientId);
}
