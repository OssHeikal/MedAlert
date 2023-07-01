import 'package:dartz/dartz.dart';

import 'package:smart_pill/core/data/error/failure.dart';
import 'package:smart_pill/features/medicine/data/datasource/remote/medicine_realtime_datasource.dart';
import 'package:smart_pill/features/medicine/data/datasource/remote/medicine_remote_datasource.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/domain/repositories/medicine_repository.dart';

class MedicineRepositoryImpl extends MedicineRepository {
  MedicineRepositoryImpl(
    this.remoteDataSource,
    this.realTimeDataSource,
  );
  final MedicineRemoteDataSource remoteDataSource;
  final MedicineRealTimeDataSource realTimeDataSource;

  @override
  Future<Either<Failure, Unit>> addDispenser(Dispenser dispenser) async {
    try {
      await remoteDataSource.addDispenser(dispenser);
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Stream<List<Dispenser>> getDispensersStream(String patientId) {
    return remoteDataSource.getDispensersStream(patientId);
  }

  @override
  Future<Either<Failure, Unit>> addDispenserToRealTimeDatabase(
      Dispenser dispenser) async {
    try {
      await realTimeDataSource.addDispenserToRealTimeDatabase(dispenser);
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDispenser(String dispenserId) async {
    try {
      await remoteDataSource.deleteDispenser(dispenserId);
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDispenserToRealTimeDatabase(
      String dispenserIndex) async {
    try {
      await realTimeDataSource
          .deleteDispenserFromRealTimeDatabase(dispenserIndex);
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
