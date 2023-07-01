import 'package:smart_pill/core/utils/enums.dart';
import 'package:smart_pill/features/medicine/data/models/schedule_model.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';

class DispenserModel extends Dispenser {
  const DispenserModel({
    required String id,
    required String index,
    required String userId,
    required String medicine,
    required MedicineType type,
    required int dose,
    required ScheduleModel schedule,
  }) : super(
          id: id,
          index: index,
          userId: userId,
          medicine: medicine,
          type: type,
          dose: dose,
          schedule: schedule,
        );

  factory DispenserModel.fromJson(Map<String, dynamic> json) => DispenserModel(
        index: json["index"],
        id: json["id"],
        userId: json["userId"],
        medicine: json["medicine"],
        dose: json["dose"],
        type: json["type"] == "capsule"
            ? MedicineType.capsule
            : MedicineType.tablet,
        schedule: ScheduleModel.fromJson(json["schedule"]),
      );
}
