import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatDateTime(DateTime dateTime) {
    final format = DateFormat('hh:mm a');
    return format.format(dateTime);
  }

  static DateTime formatTimeOfDay(String timeOfDay) {
    final format = DateFormat('hh:mm a');
    final parsedTime = format.parse(timeOfDay);
    return parsedTime;
  }

  static DateTime extractTime(String timeString) {
    final format = DateFormat('hh:mm a');
    final parsedTime = format.parse(timeString);
    return DateTime(0, 1, 1, parsedTime.hour, parsedTime.minute);
  }

  static String getWeekdayName(int weekday) {
    final DateTime now = DateTime.now();
    final DateTime date = now.subtract(Duration(days: now.weekday - weekday));

    if (_isToday(date)) {
      return 'Today';
    } else if (_isTomorrow(date)) {
      return 'Tomorrow';
    } else {
      final DateFormat formatter = DateFormat.EEEE();
      return formatter.format(date);
    }
  }

  static String _getWeekdayName(int weekday) {
    final DateTime now = DateTime.now();
    final DateTime date = now.subtract(Duration(days: now.weekday - weekday));
    final DateFormat formatter = DateFormat.EEEE();
    return formatter.format(date);
  }

  static String getWeekDayNames(List<int> weekdays) {
    weekdays.sort();
    if (weekdays.length == 7) {
      return 'Every day';
    } else if (weekdays.length == 5 &&
        weekdays.first == 1 &&
        weekdays.last == 5) {
      return 'Weekdays';
    } else if (weekdays.length == 2 &&
        weekdays.every((day) => [0, 6].contains(day))) {
      return 'Weekends';
    } else {
      List<String> weekDayNames = weekdays.map((weekday) {
        if (weekday >= 1 && weekday <= 7) {
          return _getWeekdayName(weekday).substring(0, 3);
        } else {
          return '';
        }
      }).toList();

      return weekDayNames.join(' ');
    }
  }

  static bool _isToday(DateTime date) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(const Duration(days: 1));
    return date.isAtSameMomentAs(today) ||
        (date.isBefore(tomorrow) && date.isAfter(today));
  }

  static bool _isTomorrow(DateTime date) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(const Duration(days: 1));
    final DateTime dayAfterTomorrow = tomorrow.add(const Duration(days: 1));
    return date.isAtSameMomentAs(tomorrow) ||
        (date.isAfter(tomorrow) && date.isBefore(dayAfterTomorrow));
  }
}
