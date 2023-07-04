import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/values.dart';

class DayTimeCardTile extends StatelessWidget {
  const DayTimeCardTile({
    super.key,
    required this.title,
    this.onTap,
    required this.isSelected,
    this.width,
    this.showIcon = false,
    this.selectedColor = AppColors.primary,
    this.unselectedColor = Colors.transparent,
    this.selectedTextColor = AppColors.primary,
    this.unselectedTextColor = AppColors.black,
    this.selectedIconColor = AppColors.white,
    this.unselectedIconColor = AppColors.disabledIcon,
  });

  final void Function()? onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final bool isSelected;
  final String title;
  final bool showIcon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle textStyle = textTheme.bodyMedium!.copyWith(
      fontSize: AppFontSize.f14.sp,
      fontWeight: FontWeight.bold,
      color: isSelected ? selectedTextColor : unselectedTextColor,
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppWidth.w64.w,
        padding: AppPadding.small.w,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? selectedColor : unselectedColor, width: 1.w),
          borderRadius: AppBorderRadius.medium,
          color: isSelected
              ? selectedColor.withOpacity(0)
              : selectedColor.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(title, style: textStyle, textAlign: TextAlign.center),
            if (showIcon)
              Card(
                elevation: isSelected ? 0 : 3,
                color: isSelected ? selectedColor : selectedIconColor,
                shape: const CircleBorder(),
                child: Container(
                  width: AppWidth.w40.w,
                  height: AppHeight.h20,
                  alignment: Alignment.center,
                  child: Icon(
                    size: 14.h,
                    Icons.check,
                    color: isSelected ? selectedIconColor : unselectedIconColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
