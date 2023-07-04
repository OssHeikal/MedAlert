import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/presentation/widgets/card_section_body.dart';
import 'package:med_alert/core/presentation/widgets/card_section_header.dart';
import 'package:med_alert/core/resources/values.dart';

class CardSection extends StatelessWidget {
  const CardSection({
    super.key,
    required this.title,
    required this.itemBuilder,
    required this.itemCount,
    this.width,
    this.onSeeAllPressed,
  });

  final String title;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double? width;
  final void Function()? onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardSectionHeader(title: title, onSeeAllPressed: onSeeAllPressed),
        SizedBox(height: AppHeight.h16.h),
        CardSectionBody(
          width: width,
          itemBuilder: itemBuilder,
          itemCount: itemCount,
        ),
      ],
    );
  }
}
