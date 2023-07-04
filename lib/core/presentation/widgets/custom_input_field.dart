import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/resources/colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.controller,
    this.hint,
    this.label,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.isPasswordVisible = false,
    this.toggelPasswordVisibility,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);
  final String? hint;
  final String? label;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool isPasswordVisible;
  final TextCapitalization textCapitalization;
  final void Function()? toggelPasswordVisibility;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10).w,
            child: Text('$label:', style: textTheme.labelLarge),
          ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          validator: validator,
          obscureText: isPasswordVisible,
          style: textTheme.bodySmall!.copyWith(color: AppColors.textPrimary),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            errorMaxLines: 2,
            hintText: hint,
            prefixIcon:
                prefixIcon != null ? Icon(prefixIcon, size: 20.h) : null,
            suffixIcon: obscureText
                ? IconButton(
                    icon: Visibility(
                      visible: isPasswordVisible,
                      replacement: const Icon(Icons.visibility_off),
                      child: const Icon(Icons.visibility),
                    ),
                    color: isPasswordVisible
                        ? AppColors.primary
                        : AppColors.disabled,
                    onPressed: toggelPasswordVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
