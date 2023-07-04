import 'package:med_alert/features/medicine/domain/entities/schedule.dart';

class ScheduleModel extends Schedule {
  const ScheduleModel({
    required super.times,
    required super.days,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        times: List<String>.from(json["times"].map((x) => x)),
        days: List<int>.from(json["days"].map((x) => x)),
      );

  @override
  Map<String, dynamic> toJson() => {
        "times": List<dynamic>.from(times.map((x) => x)),
        "days": List<dynamic>.from(days.map((x) => x)),
      };
}
