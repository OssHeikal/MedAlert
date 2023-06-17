import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pill/core/resorces/values.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.lable,
    required this.onTap,
    this.backgroundColor,
    this.width,
    this.height,
    this.textColor,
    this.horizontalMargin,
  });
  final String lable;
  final Function() onTap;
  final Color? textColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0).w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: backgroundColor,
          minimumSize:
              Size(width ?? AppWidth.screenWidth, height ?? AppHeight.h48.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
          ),
        ),
        child: Text(lable, style: TextStyle(color: textColor)),
      ),
    );
  }
}
