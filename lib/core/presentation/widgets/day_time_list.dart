import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/values.dart';

class DayTimeList extends StatelessWidget {
  const DayTimeList({
    super.key,
    required this.dayTime,
    required this.title,
    required this.itemBuilder,
    required this.height,
  });

  final List dayTime;
  final String title;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double? height;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle titleTextStyle =
        textTheme.titleMedium!.copyWith(fontSize: AppFontSize.f16.sp);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(22, 8, 16, 8).w,
          child: Text(title, style: titleTextStyle),
        ),
        SizedBox(
          height: height,
          child: ListView.separated(
            itemCount: dayTime.length,
            physics: const BouncingScrollPhysics(),
            padding: AppPadding.mediumH.w,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: AppWidth.w10.w),
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
