import 'package:flutter/material.dart';
import 'package:med_alert/core/resources/assets.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/utils/enums.dart';

extension MedicineTypeX on MedicineType {
  String get name {
    switch (this) {
      case MedicineType.tablet:
        return 'tablet';
      case MedicineType.capsule:
        return 'capsule';
    }
  }

  String get shortName {
    switch (this) {
      case MedicineType.tablet:
        return 'tab';
      case MedicineType.capsule:
        return 'cap';
    }
  }

  String get icon {
    switch (this) {
      case MedicineType.tablet:
        return AppAssets.tablet;
      case MedicineType.capsule:
        return AppAssets.capsule;
    }
  }

  Color get color {
    switch (this) {
      case MedicineType.tablet:
        return AppColors.accent;
      case MedicineType.capsule:
        return AppColors.primary;
    }
  }
}
