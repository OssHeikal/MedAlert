import 'package:flutter/material.dart';
import 'package:med_alert/core/presentation/widgets/card_section.dart';
import 'package:med_alert/core/resources/messages.dart';
import 'package:med_alert/features/medicine/domain/entities/medicine_schedule.dart';
import 'package:med_alert/features/medicine/presentation/components/add_medicine_tile.dart';
import 'package:med_alert/features/medicine/presentation/components/medicine_schedule_tile.dart';
import 'package:med_alert/core/presentation/widgets/empty_tile.dart';

class MedicineScheduleSection extends StatelessWidget {
  const MedicineScheduleSection({
    super.key,
    required this.medicineSchedules,
    required this.patientId,
  });

  final List<MedicineSchedule> medicineSchedules;
  final String patientId;

  @override
  Widget build(BuildContext context) {
    return CardSection(
      title: 'Medicines',
      itemCount: medicineSchedules.length + 1,
      itemBuilder: (context, index) {
        if (index < medicineSchedules.length) {
          return MedicineScheduleTile(
              medicineSchedule: medicineSchedules[index]);
        } else if (index == medicineSchedules.length) {
          return AddMedicineTile(patientId: patientId, index: index + 1);
        } else {
          return const EmptyTile(message: AppMessages.failedToLoadMedicines);
        }
      },
    );
  }
}
