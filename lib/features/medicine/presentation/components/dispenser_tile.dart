import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pill/core/helpers/values.dart';
import 'package:smart_pill/core/presentation/widgets/custom_card_tile.dart';
import 'package:smart_pill/core/presentation/widgets/medicine_icon_card.dart';
import 'package:smart_pill/core/resources/colors.dart';
import 'package:smart_pill/core/resources/values.dart';
import 'package:smart_pill/core/utils/bottom_sheet_utils.dart';
import 'package:smart_pill/core/utils/extensions.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/presentation/widgets/edit_dispenser_form.dart';

class DispenserTile extends StatelessWidget {
  const DispenserTile({
    super.key,
    required this.dispenser,
  });
  final Dispenser dispenser;

  @override
  Widget build(BuildContext context) {
    final String intake = Values.getIntakePerWeek(
      dispenser.dose,
      dispenser.schedule.times.length,
      dispenser.schedule.times.length,
    ).toString();
    return CustomCardTile(
      onTap: () => BottomSheetUtils.showButtomSheet(
          context, EditDispenserForm(dispenser: dispenser)),
      icon: MedicineIconCard(type: dispenser.type),
      title: dispenser.medicine,
      subtitle: '$intake ${dispenser.type.shortName} / week',
      footer: CardTileFooter(color: dispenser.type.color, id: dispenser.index),
      color: dispenser.type.color.withOpacity(0.1),
    );
  }
}

class CardTileFooter extends StatelessWidget {
  const CardTileFooter({
    super.key,
    required this.id,
    required this.color,
  });
  final Color color;
  final String id;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("#$id", style: textTheme.bodyMedium),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 14.w).w,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(100).w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Edit',
                  style: textTheme.titleSmall!.copyWith(
                    fontSize: AppFontSize.f12.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
