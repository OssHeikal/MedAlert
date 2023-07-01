import 'package:smart_pill/features/medicine/domain/entities/schedule.dart';

class ScheduleModel extends Schedule {
  const ScheduleModel({
    required super.times,
    required super.days,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        times: List<String>.from(json["times"].map((x) => x)),
        days: List<int>.from(json["days"].map((x) => x)),
      );

 
}
