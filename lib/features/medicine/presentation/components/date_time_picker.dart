import 'package:flutter/cupertino.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    super.key,
    required this.onDateTimeChanged,
  });
  final void Function(DateTime) onDateTimeChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.only(top: 8),
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: onDateTimeChanged,
        initialDateTime: DateTime.now(),
      ),
    );
  }
}
