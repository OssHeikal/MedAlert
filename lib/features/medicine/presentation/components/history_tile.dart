import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pill/core/presentation/widgets/custom_card_tile.dart';
import 'package:smart_pill/core/presentation/widgets/medicine_icon_card.dart';
import 'package:smart_pill/core/resources/colors.dart';
import 'package:smart_pill/core/resources/values.dart';
import 'package:smart_pill/core/utils/extensions.dart';
import 'package:smart_pill/features/medicine/domain/entities/medicine.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
    required this.medicine,
  });
  final Medicine medicine;

  @override
  Widget build(BuildContext context) {
    return CustomCardTile(
      icon: MedicineIconCard(type: medicine.type),
      title: medicine.name,
      subtitle: '${medicine.dose} ${medicine.type.name}',
      footer:
          HistoryTileFooter(color: medicine.type.color, time: medicine.time),
      color: medicine.type.color.withOpacity(0.1),
    );
  }
}

class HistoryTileFooter extends StatelessWidget {
  const HistoryTileFooter({
    super.key,
    required this.color,
    required this.time,
  });
  final Color color;
  final String time;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle titleTextStyle = textTheme.titleSmall!.copyWith(
      color: AppColors.white,
      fontSize: AppFontSize.f13.sp,
    );
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12).w,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(100).w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Taken', style: titleTextStyle),
            Icon(Icons.done_all, size: 14.h, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
