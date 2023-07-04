import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/values.dart';
import 'package:med_alert/features/calendar/presentation/controller/cubit/calendar_cubit.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({
    super.key,
    required this.caledarCubit,
  });

  final CalendarCubit caledarCubit;

  @override
  Widget build(BuildContext context) {
    final focusedDay = caledarCubit.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: focusedDay,
          calendarFormat: CalendarFormat.week,
          rowHeight: 45,
          selectedDayPredicate: (day) => isSameDay(day, focusedDay),
          onDaySelected: (selectedDay, focusedDay) {
            caledarCubit.changeSelectedDate(selectedDay);
          },
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(
              fontSize: AppFontSize.f16.sp,
              color: AppColors.backgroundSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            headerPadding: EdgeInsets.zero,
          ),
          daysOfWeekHeight: 20,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.f16.sp,
            ),
            weekendStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.f16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
