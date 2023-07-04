import 'package:equatable/equatable.dart';
import 'package:med_alert/core/utils/enums.dart';

class Medicine extends Equatable {
  const Medicine({
    required this.name,
    required this.type,
    required this.dose,
    required this.time,
    // required this.weekday,
    // required this.status,
  });

  final String name;
  final MedicineType type;
  final int dose;
  final String time;
  // final int weekday;
  // final MedicineStatus status;

  @override
  List<Object?> get props => [name, type, dose, time];
}
