import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';

abstract class MedicineRealTimeDataSource {
  Future<Unit> addDispenserToRealTimeDatabase(Dispenser dispenser);
  Future<Unit> deleteDispenserFromRealTimeDatabase(String id);
}

class MedicineRealTimeDataSourceImpl extends MedicineRealTimeDataSource {
  MedicineRealTimeDataSourceImpl();

  final FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  Future<Unit> addDispenserToRealTimeDatabase(Dispenser dispenser) async {
    final DatabaseReference dispenserRef =
        database.ref("dis_${dispenser.index}");
    await dispenserRef.set(dispenser.toRealtimeMap());
    return unit;
  }

  @override
  Future<Unit> deleteDispenserFromRealTimeDatabase(String id) async {
    final DatabaseReference dispenserRef = database.ref("dis_$id");
    await dispenserRef.remove();
    return unit;
  }
}
