import 'package:smart_pill/features/medicine/domain/entities/medicine.dart';

class MedicineModel extends Medicine {
  const MedicineModel({
    required super.name,
    required super.type,
    required super.dose,
    // required super.weekday,
    // required super.status,
    required super.time,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        name: json["name"],
        type: json["type"],
        dose: json["dose"],
        time: json["time"],
        // weekday: json["weekday"],
        // status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "dose": dose,
        "time": time,
        // "weekday": weekday,
        // "status": status,
      };
}
