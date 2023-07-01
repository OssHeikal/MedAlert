import 'package:flutter/material.dart';
import 'package:smart_pill/core/resources/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.primary,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
