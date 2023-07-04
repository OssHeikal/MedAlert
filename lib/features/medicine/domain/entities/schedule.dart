import 'package:equatable/equatable.dart';

 class Schedule extends Equatable {
  const Schedule({
    required this.times,
    required this.days,
  });

  final List<String> times;
  final List<int> days;

  const Schedule.empty()
      : times = const [],
        days = const [];

  Map<String, dynamic> toJson() => {
        "times": List<dynamic>.from(times.map((x) => x)),
        "days": List<dynamic>.from(days.map((x) => x)),
      };

  @override
  List<Object?> get props => [times, days];
}
