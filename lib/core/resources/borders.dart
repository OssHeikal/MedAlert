import 'package:flutter/material.dart';
import 'package:med_alert/core/resources/colors.dart';

class AppBorders {
  static const borderDirectionalMiddel = BorderDirectional(
    start: BorderSide(color: AppColors.divider, width: 0),
    end: BorderSide(width: 0, color: AppColors.divider),
    top: BorderSide(width: 0.5, color: AppColors.divider),
    bottom: BorderSide(width: 0.5, color: AppColors.divider),
  );
  static const borderDirectionalEnd = BorderDirectional(
    start: BorderSide(color: AppColors.divider, width: 0),
    end: BorderSide(width: 0.5, color: AppColors.divider),
    top: BorderSide(width: 0.5, color: AppColors.divider),
    bottom: BorderSide(width: 0.5, color: AppColors.divider),
  );
  static const borderDirectionalStart = BorderDirectional(
    start: BorderSide(color: AppColors.divider, width: 0.5),
    end: BorderSide(width: 0, color: AppColors.divider),
    top: BorderSide(width: 0.5, color: AppColors.divider),
    bottom: BorderSide(width: 0.5, color: AppColors.divider),
  );
  static const borderDirectionalAll = BorderDirectional(
    start: BorderSide(color: AppColors.divider, width: 0.5),
    end: BorderSide(width: 0.5, color: AppColors.divider),
    top: BorderSide(width: 0.5, color: AppColors.divider),
    bottom: BorderSide(width: 0.5, color: AppColors.divider),
  );
}
