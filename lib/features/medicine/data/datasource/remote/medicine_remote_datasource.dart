import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:med_alert/features/medicine/data/models/medicne_schedule_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:med_alert/features/medicine/domain/entities/medicine_schedule.dart';

abstract class MedicineRemoteDataSource {
  Future<Unit> addMedicineSchedule(MedicineSchedule dispenser);
  Future<Unit> deleteMedicineSchedule(String id);
  Stream<List<MedicineScheduleModel>> getAllMedicinesStream(String patientId);
}

class MedicineRemoteDataSourceImpl extends MedicineRemoteDataSource {
  MedicineRemoteDataSourceImpl();

  final CollectionReference patientsCollection =
      FirebaseFirestore.instance.collection('dispensers');

  @override
  Stream<List<MedicineScheduleModel>> getAllMedicinesStream(String patientId) {
    return patientsCollection
        .where('userId', isEqualTo: patientId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return MedicineScheduleModel.fromJson(
                doc.data() as Map<String, dynamic>);
          }).toList(),
        );
  }

  @override
  Future<Unit> addMedicineSchedule(MedicineSchedule dispenser) async {
    await patientsCollection.doc(dispenser.id).set(dispenser.toJson());
    return unit;
  }

  @override
  Future<Unit> deleteMedicineSchedule(String id) {
    return patientsCollection.doc(id).delete().then((value) => unit);
  }
}
