import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pill/core/resources/values.dart';

class CardSectionHeader extends StatelessWidget {
  const CardSectionHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: AppMargin.largeH.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.titleMedium),
          Text('See all', style: textTheme.titleSmall),
        ],
      ),
    );
  }
}
