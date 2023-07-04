import 'package:med_alert/features/medicine/domain/entities/schedule.dart';

class NotificationData {
  NotificationData({
    required this.id,
    required this.body,
    required this.title,
    required this.schedule,
    // required this.payload,
  });
  final int id;
  final String title;
  final String body;
  final Schedule schedule;
  // final String payload;
}
