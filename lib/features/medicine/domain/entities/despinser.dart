import 'package:equatable/equatable.dart';
import 'package:smart_pill/core/helpers/date_time_formatter.dart';
import 'package:smart_pill/core/utils/enums.dart';
import 'package:smart_pill/features/medicine/domain/entities/schedule.dart';

class Dispenser extends Equatable {
  const Dispenser({
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
  final String index;
  final String medicine;
  final MedicineType type;
  final int dose;
  final Schedule schedule;

  const Dispenser.empty()
      : id = '',
        index = '',
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

  Map<String, dynamic> toRealtimeMap() => {
        "DAY": DateTimeFormatter.getWeekDay(schedule.days),
        "Hour": DateTimeFormatter.getHours(schedule.time!),
        "Minute": DateTimeFormatter.getMinutes(schedule.time!),
      };

  @override
  List<Object?> get props =>
      [userId, index, medicine, type, dose, schedule, id];
}
