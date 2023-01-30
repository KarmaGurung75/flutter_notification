import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Check Weather the notification is allowed in your device

  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  void initState() {
    _checkNotificationEnabled();
    super.initState();
  }

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: double.infinity,
        // color: Colors.green,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(
                  letterSpacing: 2,
                  color: Colors.black,
                  // fontSize: Dimensions.font12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto-bold')),
          onPressed: () {
            AwesomeNotifications().createNotification(
                content: NotificationContent(
                    id: counter,
                    channelKey: 'basic_channel',
                    title: 'Notification',
                    body: 'This is a notification'));
            setState(() {
              counter++;
            });
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          child: const Text('click Me'),
        ),
      )),
    );
  }
}
