import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pill/core/resources/colors.dart';
import 'package:smart_pill/core/resources/values.dart';
import 'package:smart_pill/core/utils/bottom_sheet_utils.dart';

import '../widgets/add_dispenser_form.dart';

class AddDispenserTile extends StatelessWidget {
  const AddDispenserTile({
    super.key,
    required this.patientId,
  });
  final String patientId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BottomSheetUtils.showButtomSheet(
          context, AddDispenserForm(patientId: patientId)),
      child: Container(
        margin: const EdgeInsets.only(right: 10).w,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.primary.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: AppColors.primary, size: 30.h),
            Text(
              'Add',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: AppFontSize.f16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
