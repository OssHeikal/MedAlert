import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:smart_pill/features/medicine/data/models/dispenser_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';

abstract class MedicineRemoteDataSource {
  Future<Unit> addDispenser(Dispenser dispenser);
  Future<Unit> deleteDispenser(String id);
  Stream<List<DispenserModel>> getDispensersStream(String patientId);
}

class MedicineRemoteDataSourceImpl extends MedicineRemoteDataSource {
  MedicineRemoteDataSourceImpl();

  final CollectionReference patientsCollection =
      FirebaseFirestore.instance.collection('dispensers');

  @override
  Stream<List<DispenserModel>> getDispensersStream(String patientId) {
    return patientsCollection
        .where('userId', isEqualTo: patientId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return DispenserModel.fromJson(doc.data() as Map<String, dynamic>);
          }).toList(),
        );
  }

  @override
  Future<Unit> addDispenser(Dispenser dispenser) async {
    await patientsCollection.doc(dispenser.id).set(dispenser.toJson());
    return unit;
  }

  @override
  Future<Unit> deleteDispenser(String id) {
    return patientsCollection.doc(id).delete().then((value) => unit);
  }
}
