import 'package:flutter/material.dart';
import 'package:smart_pill/core/helpers/date_time_formatter.dart';
import 'package:smart_pill/core/presentation/widgets/card_section.dart';
import 'package:smart_pill/core/resources/strings.dart';
import 'package:smart_pill/features/medicine/domain/entities/medicine.dart';
import 'package:smart_pill/core/presentation/widgets/empty_tile.dart';
import 'package:smart_pill/features/medicine/presentation/components/medicine_tile.dart';

class MedicineSection extends StatelessWidget {
  const MedicineSection({
    super.key,
    required this.medicines,
    required this.currentWeekday,
  });
  final List<Medicine> medicines;
  final int currentWeekday;

  @override
  Widget build(BuildContext context) {
    final String currentWeekdayName =
        DateTimeFormatter.getWeekdayName(currentWeekday);
    return CardSection(
      title: '$currentWeekdayName\'s Medications',
      itemCount: medicines.isNotEmpty ? medicines.length : 1,
      itemBuilder: (context, index) {
        if (medicines.isEmpty) {
          return const EmptyTile(message: AppStrings.noMedicines);
        } else {
          return MedicineTile(medicine: medicines[index]);
        }
      },
    );
  }
}
