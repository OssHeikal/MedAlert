import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetUtils {
  static void showButtomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          // height: AppHeight.screenHeight() * 0.8,
          children: [
            child,
          ],
        );
      },
    );
  }
}
