import 'package:flutter/material.dart';
import 'package:med_alert/core/presentation/widgets/custom_back_button.dart';

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
              // sl<NotificationRepository>().scheduleWeeklyNotification(
              //   0,
              //   'Medication Time',
              //   'Time to take your medicine',
              //   const Schedule(
              //     days: [DateTime.sunday, DateTime.monday],
              //     times: ['08:56 PM', '08:57 PM'],
              //   ),
              // );
            },
            child: const Text('send notification'),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     sl<NotificationRepository>().cancelNotification(
          //       const Schedule(
          //         days: [DateTime.sunday, DateTime.monday],
          //         times: ['08:55 PM', '05:56 PM'],
          //       ),
          //     );
          //   },
          //   child: const Text('cancel notification'),
          // ),
        ],
      ),
    );
  }
}
