import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/values.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color = AppColors.textPrimary,
    this.isLast = false,
  });
  final String label;
  final IconData icon;
  final Function() onTap;
  final Color color;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
        onTap: onTap,
        child: Column(
          children: [
            ListTile(
              visualDensity: VisualDensity.compact,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              leading: Icon(icon, color: color),
              title: Text(label,
                  style: textTheme.bodyMedium!.copyWith(color: color)),
              trailing: Icon(Icons.arrow_forward_ios,
                  size: AppSize.s16.sp, color: color),
            ),
            if (!isLast)
              Divider(
                height: 0,
                thickness: 1,
                indent: AppWidth.w52.w,
                color: AppColors.divider.withOpacity(0.2),
              ),
          ],
        ));
  }
}


// Container(
//         // margin: const EdgeInsets.only(left: p16).w,
//         padding: const EdgeInsets.fromLTRB(0, p16, p16, p16).w,
//         decoration: BoxDecoration(
//           border: isLast
//               ? null
//               : Border(
//                   bottom:
//                       BorderSide(color: AppColors.divider.withOpacity(0.5))),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: color),
//             SizedBox(width: AppWidth.w16.w),
//             Text(label, style: textTheme.bodyMedium!.copyWith(color: color)),
//             const Spacer(),
//             Icon(Icons.arrow_forward_ios, size: AppSize.s16.sp, color: color),
//           ],
//         ),
//       ),