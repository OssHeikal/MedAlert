import 'package:flutter/material.dart';
import 'package:smart_pill/core/presentation/widgets/custom_back_button.dart';
import 'package:smart_pill/core/services/service_locator.dart';
import 'package:smart_pill/features/medicine/domain/entities/schedule.dart';
import 'package:smart_pill/features/notifications/domain/repository/notification_repository.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Notifications'),
          ),
          ElevatedButton(
              onPressed: () {
                sl<NotificationRepository>().scheduleWeeklyNotification(
                  0,
                  'Medication Time',
                  'Time to take your medicine',
                  Schedule(
                    time: DateTime.now().add(const Duration(seconds: 15)),
                    days: const [DateTime.thursday],
                    times: const [],
                  ),
                );
              },
              child: const Text('send notification'))
        ],
      ),
    );
  }
}
