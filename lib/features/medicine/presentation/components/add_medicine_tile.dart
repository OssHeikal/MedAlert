import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/values.dart';
import 'package:med_alert/core/utils/bottom_sheet_utils.dart';

import '../widgets/medicine_form.dart';

class AddMedicineTile extends StatelessWidget {
  const AddMedicineTile({
    super.key,
    required this.patientId,
    required this.index,
  });
  final String patientId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BottomSheetUtils.showButtomSheet(
          context, MedicineForm(patientId: patientId, index: index)),
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
