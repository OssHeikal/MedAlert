import 'package:intl/intl.dart';

class DateTimeFormatter {
  static DateTime extractTime(String timeString) {
    final format = DateFormat('hh:mm a');
    final parsedTime = format.parse(timeString);
    return DateTime(0, 1, 1, parsedTime.hour, parsedTime.minute);
  }

  static String getWeekdayName(int weekday) {
    final DateTime now = DateTime.now();
    final DateTime date = now.subtract(Duration(days: now.weekday - weekday));

    if (isToday(date)) {
      return 'Today';
    } else if (isTomorrow(date)) {
      return 'Tomorrow';
    } else {
      final DateFormat formatter = DateFormat.EEEE();
      return formatter.format(date);
    }
  }

  static bool isToday(DateTime date) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(const Duration(days: 1));
    return date.isAtSameMomentAs(today) ||
        (date.isBefore(tomorrow) && date.isAfter(today));
  }

  static bool isTomorrow(DateTime date) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(const Duration(days: 1));
    final DateTime dayAfterTomorrow = tomorrow.add(const Duration(days: 1));
    return date.isAtSameMomentAs(tomorrow) ||
        (date.isAfter(tomorrow) && date.isBefore(dayAfterTomorrow));
  }

  static String formatDateTime(DateTime dateTime) {
    final format = DateFormat('hh:mm a');
    return format.format(dateTime);
  }

  static int getHours(DateTime dateTime) {
    return dateTime.hour;
  }

  static int getMinutes(DateTime dateTime) {
    return dateTime.minute;
  }

  static int getWeekDay(List<int> days) {
    switch (days.first) {
      case DateTime.sunday:
        return 0;
      case DateTime.monday:
        return 1;
      case DateTime.tuesday:
        return 2;
      case DateTime.wednesday:
        return 3;
      case DateTime.thursday:
        return 4;
      case DateTime.friday:
        return 5;
      case DateTime.saturday:
        return 6;
      default:
        return 0;
    }
  }

  static String getWeekDayName(int weekday) {
    switch (weekday) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return 'Sunday';
    }
  }
}
