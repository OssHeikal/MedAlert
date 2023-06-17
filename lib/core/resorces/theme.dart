import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_pill/core/resorces/colors.dart';
import 'package:smart_pill/core/resorces/values.dart';

class AppTheme {
  static ThemeData getThemeData() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.backgroundPrimary,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.accent,
      ),

      // textTheme
      textTheme: TextTheme(
        titleSmall: _getTextStyle(
          fontSize: AppFontSize.f16.h,
          color: AppColors.textSecondary,
        ),
        titleMedium: _getTextStyle(
          fontSize: AppFontSize.f20.h,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleLarge: _getTextStyle(
          fontSize: AppFontSize.f24.h,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodySmall: _getTextStyle(
          fontSize: AppFontSize.f14.h,
          color: AppColors.textSecondary,
        ),
        bodyMedium: _getTextStyle(
          fontSize: AppFontSize.f16.h,
          color: AppColors.textPrimary,
        ),
        bodyLarge: _getTextStyle(
          fontSize: AppFontSize.f20.h,
          color: AppColors.textPrimary,
        ),
      ),

      // inputDecorationTheme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        hintStyle: TextStyle(
            color: AppColors.textSecondary, fontSize: AppFontSize.f14.h),
        errorStyle:
            TextStyle(color: AppColors.error, fontSize: AppFontSize.f14.h),
        contentPadding: AppPadding.small.w,
        prefixIconColor: AppColors.disabledIcon,
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.small,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.small,
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.small,
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.small,
          borderSide: BorderSide.none,
        ),
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.backgroundPrimary,
        iconTheme: IconThemeData(color: AppColors.primary, size: 22.sp),
      ),
    );
  }
}

TextStyle _getTextStyle({
  required double fontSize,
  FontWeight? fontWeight,
  required Color color,
}) {
  return GoogleFonts.didactGothic(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
