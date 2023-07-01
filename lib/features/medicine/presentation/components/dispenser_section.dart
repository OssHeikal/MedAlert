import 'package:flutter/material.dart';
import 'package:smart_pill/core/presentation/widgets/card_section.dart';
import 'package:smart_pill/core/resources/strings.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/presentation/components/add_dispenser_tile.dart';
import 'package:smart_pill/features/medicine/presentation/components/dispenser_tile.dart';
import 'package:smart_pill/core/presentation/widgets/empty_tile.dart';

class DispenserSection extends StatelessWidget {
  const DispenserSection({
    super.key,
    required this.dispensers,
    required this.patientId,
  });

  final List<Dispenser> dispensers;
  final String patientId;

  @override
  Widget build(BuildContext context) {
    return CardSection(
      title: 'Dispenser',
      itemCount: dispensers.length < 4 ? dispensers.length + 1 : 4,
      itemBuilder: (context, index) {
        if (index < dispensers.length) {
          return DispenserTile(dispenser: dispensers[index]);
        } else if (index == dispensers.length && dispensers.length < 4) {
          return AddDispenserTile(patientId: patientId);
        } else {
          return const EmptyTile(message: AppStrings.noDispensers);
        }
      },
    );
  }
}
