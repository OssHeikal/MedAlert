import 'package:flutter/material.dart';

class MedicineTextField extends StatelessWidget {
  const MedicineTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.textAlign = TextAlign.start,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return TextField(
      controller: controller,
      style: textTheme.bodyMedium,
      textAlign: textAlign,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: textTheme.bodySmall,
      ),
    );
  }
}
