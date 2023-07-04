import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/values.dart';

class CardSectionHeader extends StatelessWidget {
  const CardSectionHeader({
    super.key,
    required this.title,
    this.onSeeAllPressed,
  });
  final String title;
  final void Function()? onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: AppMargin.largeH.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.titleMedium),
          GestureDetector(
            onTap: onSeeAllPressed,
            child: onSeeAllPressed == null
                ? const SizedBox.shrink()
                : Text('See all', style: textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}
