import 'package:demo_scheduled_notification/services/notifi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

DateTime scheduleTime = DateTime.now();

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DatePickerTxt(),
            ScheduleBtn(),
          ],
        ),
      ),
    );
  }
}

class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({super.key});

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}

class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onChanged: (time) => scheduleTime = time,
          onConfirm: (time) {},
        );
      },
      child: const Text("Select Datetime"),
    );
  }
}

class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Notification scheduled for $scheduleTime");
        NotificationService().scheduleNotification(
          title: "Scheduled Notification",
          body: "$scheduleTime",
          scheduledNotificationDateTime: scheduleTime,
        );
      },
      child: const Text("Schedule notification"),
    );
  }
}
