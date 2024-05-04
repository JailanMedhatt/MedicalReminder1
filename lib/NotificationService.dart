import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('elder');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {
          onNotificationClick(payload);
            });

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS
    );
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {

            });
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            ongoing: true,color:Colors.purple,autoCancel: false,

            actions: [
              AndroidNotificationAction(
               'accept',
                'accept',
                  allowGeneratedReplies: true
              ),

            ],
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    // const String actionKey = 'ACTION_KEY';
    // const String actionTitle = 'Action';
    return notificationsPlugin.show(
        id, title, body,  await notificationDetails(),
    //   actions: [
    //   NotificationAction(
    //     actionKey,
    //     actionTitle,
    //   ),
    // ],
    );
  }

  Future scheduleNotification(
      {int id = 0,
        String? title,
        String? body,
        String? payLoad,

        // required int day,
        // required int month,
        // required int year,

        required DateTime scheduledNotificationDateTime}) async {
    // tz.initializeTimeZones();
    // log(tz.TZDateTime.now(tz.local).hour.toString());
    // log(tz.local.name);
    return notificationsPlugin.zonedSchedule(
        id,
        title,
        body,


        tz.TZDateTime.from(
          scheduledNotificationDateTime,
          tz.local,

        ),

        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }
  Future<void> onNotificationClick(String? payload) async {
    if (payload != null) {
      if (payload == 'accept') {
        print("ok in notification work");
      }
      print("object");
    }
    print("no payload");
  }
}