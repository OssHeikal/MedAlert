import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/values.dart';

class AppTheme {
  static ThemeData getThemeData() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.backgroundSecondary,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.accent,
      ),

      // textTheme
      textTheme: TextTheme(
        titleSmall: _getTextStyle(
          fontSize: AppFontSize.f16.sp,
          color: AppColors.textSecondary,
        ),
        titleMedium: _getTextStyle(
          fontSize: AppFontSize.f20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleLarge: _getTextStyle(
          fontSize: AppFontSize.f24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodySmall: _getTextStyle(
          fontSize: AppFontSize.f14.sp,
          color: AppColors.textSecondary,
        ),
        bodyMedium: _getTextStyle(
          fontSize: AppFontSize.f16.sp,
          color: AppColors.textPrimary,
        ),
        bodyLarge: _getTextStyle(
          fontSize: AppFontSize.f20.sp,
          color: AppColors.textPrimary,
        ),
      ),

      // inputDecorationTheme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        hintStyle: TextStyle(
            color: AppColors.textSecondary, fontSize: AppFontSize.f14.sp),
        errorStyle:
            TextStyle(color: AppColors.error, fontSize: AppFontSize.f14.sp),
        contentPadding: AppPadding.small.w,
        prefixIconColor: AppColors.disabledIcon,
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.xSmall,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.xSmall,
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.xSmall,
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.xSmall,
          borderSide: BorderSide.none,
        ),
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.backgroundSecondary,
        iconTheme: IconThemeData(size: 24.sp),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppFontSize.f16.sp,
          fontWeight: FontWeight.w500,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),

      // Divider theme
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.xSmall,
          ),
          padding: AppPadding.small.w,
          textStyle: TextStyle(
            fontSize: AppFontSize.f16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
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
