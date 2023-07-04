import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/borders.dart';
import 'package:med_alert/core/resources/values.dart';

class CustomInputCard extends StatelessWidget {
  const CustomInputCard({
    Key? key,
    required this.label,
    this.width,
    this.leading,
    required this.content,
    this.trailing,
    this.margin = const EdgeInsets.all(16),
  }) : super(key: key);

  final String label;
  final double? width;
  final Widget? leading;
  final Widget content;
  final Widget? trailing;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle =
        textTheme.titleMedium!.copyWith(fontSize: AppFontSize.f16.sp);
    final hasLeading = leading != null;
    final hasTrailing = trailing != null;

    return Container(
      margin: margin,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8, bottom: 4).w,
            child: Text(label, style: titleStyle),
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                if (hasLeading) ...[
                  Container(
                    width: AppWidth.w48.w,
                    height: AppHeight.h48.h,
                    decoration: BoxDecoration(
                      border: AppBorders.borderDirectionalStart,
                      borderRadius: BorderRadius.only(
                        topLeft: AppRadius.small.r,
                        bottomLeft: AppRadius.small.r,
                      ),
                    ),
                    child: leading,
                  ),
                  VerticalDivider(indent: 12.sp, endIndent: 12.sp, width: 0),
                ],
                Expanded(
                  child: Container(
                    height: AppHeight.h48.h,
                    decoration: BoxDecoration(
                        border: _border, borderRadius: _borderRadius),
                    child: content,
                  ),
                ),
                if (hasTrailing) ...[
                  VerticalDivider(indent: 12.sp, endIndent: 12.sp, width: 0),
                  Container(
                    width: AppWidth.w48.w,
                    height: AppWidth.w48.h,
                    decoration: BoxDecoration(
                      border: AppBorders.borderDirectionalEnd,
                      borderRadius: BorderRadius.only(
                        topRight: AppRadius.small.r,
                        bottomRight: AppRadius.small.r,
                      ),
                    ),
                    child: trailing,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  BorderDirectional get _border {
    if (leading == null && trailing == null) {
      return AppBorders.borderDirectionalAll;
    } else if (trailing == null) {
      return AppBorders.borderDirectionalEnd;
    } else if (leading == null) {
      return AppBorders.borderDirectionalStart;
    } else {
      return AppBorders.borderDirectionalMiddel;
    }
  }

  BorderRadius get _borderRadius {
    if (leading == null && trailing == null) {
      return const BorderRadius.all(AppRadius.small).w;
    } else if (trailing == null) {
      return BorderRadius.only(
        topRight: AppRadius.small.r,
        bottomRight: AppRadius.small.r,
      );
    } else if (leading == null) {
      return BorderRadius.only(
        topLeft: AppRadius.small.r,
        bottomLeft: AppRadius.small.r,
      );
    } else {
      return const BorderRadius.only();
    }
  }
}
