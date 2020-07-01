import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  final notification = FlutterLocalNotificationsPlugin();

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) =>
                selectNotification(payload));

    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    notification.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen(payload: payload)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            var androidPlatformChannelSpecifics = AndroidNotificationDetails(
                'your channel id',
                'your channel name',
                'your channel description',
                importance: Importance.Max,
                priority: Priority.High,
                ticker: 'ticker');
            var iOSPlatformChannelSpecifics = IOSNotificationDetails();
            var notificationDetails = NotificationDetails(
                androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
            notification.show(
                0, 'Title', 'This is notification body', notificationDetails,
                payload: 'item x');
          },
          child: Text('Show Notification'),
        ),
      ),
    );
  }
}
