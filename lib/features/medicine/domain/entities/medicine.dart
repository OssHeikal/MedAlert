import 'package:equatable/equatable.dart';
import 'package:smart_pill/core/utils/enums.dart';

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


//  static List<Medicine> getMedicinesForCurrentWeekday(
//       List<Dispenser> dispensers, int currentWeekday) {
//     List<Medicine> medicines = [];

//     for (final Dispenser dispenser in dispensers) {
//       if (dispenser.schedule.days.contains(currentWeekday)) {
//         for (final time in dispenser.schedule.times) {
//           medicines.add(
//             Medicine(
              
//               name: dispenser.medicine,
//               type: dispenser.type,
//               dose: dispenser.dose,
//               time: time,
//               // status: MedicineStatus.pending,
//             ),
//           );
//         }
//       }
//     }
//     medicines.sort((a, b) {
//       final aTime = DateTimeFormatter.extractTime(a.time);
//       final bTime = DateTimeFormatter.extractTime(b.time);
//       return aTime.compareTo(bTime);
//     });
//     return medicines;
//   }



  // static List<Medicine> medicines = [
  //   const Medicine(
  //     name: 'Vitamin C',
  //     type: MedicineType.tablet,
  //     dose: 2,
  //     time: '8:00 AM',
  //     status: MedicineStatus.pending,
  //   ),
  //   const Medicine(
  //     name: 'Paracetamol',
  //     type: MedicineType.tablet,
  //     dose: 2,
  //     time: '9:00 AM',
  //     status: MedicineStatus.pending,
  //   ),
  //   const Medicine(
  //     name: 'Paracetamol',
  //     type: MedicineType.tablet,
  //     dose: 2,
  //     time: '03:00 PM',
  //     status: MedicineStatus.pending,
  //   ),
  //   const Medicine(
  //     name: 'Vitamin C',
  //     type: MedicineType.tablet,
  //     dose: 2,
  //     time: '08:00 PM',
  //     status: MedicineStatus.pending,
  //   ),
  //   const Medicine(
  //     name: 'Paracetamol',
  //     type: MedicineType.tablet,
  //     dose: 2,
  //     time: '09:00 PM',
  //     status: MedicineStatus.pending,
  //   ),
  // ];