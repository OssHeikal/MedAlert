import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pill/core/resources/colors.dart';
import 'package:smart_pill/core/resources/values.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: AppMargin.medium.w,
        child: const CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
