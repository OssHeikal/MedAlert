import 'package:flutter/material.dart';
import 'package:smart_pill/core/presentation/widgets/card_section.dart';
import 'package:smart_pill/core/resources/strings.dart';
import 'package:smart_pill/features/medicine/domain/entities/medicine.dart';
import 'package:smart_pill/core/presentation/widgets/empty_tile.dart';
import 'package:smart_pill/features/medicine/presentation/components/history_tile.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({
    super.key,
    required this.medicines,
    required this.currentWeekday,
  });
  final List<Medicine> medicines;
  final int currentWeekday;

  @override
  Widget build(BuildContext context) {
    // final String currentWeekdayName =
    //     DateTimeFormatter.getWeekdayName(currentWeekday);
    return CardSection(
      title: 'History',
      itemCount: medicines.isNotEmpty ? medicines.length : 1,
      itemBuilder: (context, index) {
        if (medicines.isEmpty) {
          return const EmptyTile(message: AppStrings.noMedicines);
        } else {
          return HistoryTile(medicine: medicines[index]);
        }
      },
    );
  }
}
