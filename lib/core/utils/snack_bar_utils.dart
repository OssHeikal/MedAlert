import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/values.dart';

class SnackBarUtils {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showErrorSnackBar(
      BuildContext context, String errorTitle, String errorMessage) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bottomMargin = AppHeight.screenHeight() - AppHeight.h120.h;
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.medium),
      elevation: 0,
      backgroundColor: AppColors.backgroundPrimary,
      margin:
          EdgeInsets.fromLTRB(AppWidth.w16, 0, AppWidth.w16, bottomMargin).w,
      content: SizedBox(
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.error),
            SizedBox(width: AppWidth.w16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    errorTitle,
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: AppHeight.h2.h),
                  Text(
                    errorMessage,
                    style: textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
