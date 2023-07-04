import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/values.dart';

class CustomCardTile extends StatelessWidget {
  const CustomCardTile({
    required this.title,
    required this.subtitle,
    super.key,
    this.icon,
    this.footer,
    this.color,
    this.width,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final Widget? icon;
  final Widget? footer;
  final Color? color;
  final double? width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle subtitleStyle =
        textTheme.titleSmall!.copyWith(fontSize: AppFontSize.f15.sp);
    TextStyle titleStyle = textTheme.titleMedium!.copyWith(
      fontSize: AppFontSize.f16.sp,
      fontWeight: FontWeight.w600,
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppWidth.w120.w,
        margin: const EdgeInsets.only(right: 10).w,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.small.w,
          color: color ?? AppColors.primary.withOpacity(0.1),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon ?? const SizedBox.shrink(),
              const Spacer(flex: 1),
              Text(title, style: titleStyle),
              Text(subtitle, style: subtitleStyle),
              const Spacer(flex: 2),
              footer ?? const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
