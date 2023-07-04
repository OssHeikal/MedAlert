import 'package:equatable/equatable.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/features/medicine/domain/entities/schedule.dart';

class MedicineSchedule extends Equatable {
  const MedicineSchedule({
    required this.id,
    required this.index,
    required this.userId,
    required this.medicine,
    required this.dose,
    required this.type,
    required this.schedule,
  });

  final String id;
  final String userId;
  final int index;
  final String medicine;
  final MedicineType type;
  final int dose;
  final Schedule schedule;

  const MedicineSchedule.empty()
      : id = '',
        index = 0,
        userId = '',
        medicine = '',
        type = MedicineType.capsule,
        dose = 0,
        schedule = const Schedule.empty();

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "index": index,
        "medicine": medicine,
        "dose": dose,
        "type": type.name,
        "schedule": schedule.toJson(),
      };

  @override
  List<Object?> get props =>
      [userId, index, medicine, type, dose, schedule, id];
}
