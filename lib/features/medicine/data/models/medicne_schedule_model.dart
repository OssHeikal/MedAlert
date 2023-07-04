import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/features/medicine/data/models/schedule_model.dart';
import 'package:med_alert/features/medicine/domain/entities/medicine_schedule.dart';

class MedicineScheduleModel extends MedicineSchedule {
  const MedicineScheduleModel({
    required String id,
    required int index,
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

  factory MedicineScheduleModel.fromJson(Map<String, dynamic> json) =>
      MedicineScheduleModel(
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
