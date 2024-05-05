import 'dart:developer';

import 'package:finalproject1/utilsNotification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
// custom_notification.dart

import 'package:flutter/material.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    // Initialize the time zones
    tz.initializeTimeZones();

    // Initialization settings for Android
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('elder');

    // Initialization settings for iOS
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
          int id,
          String? title,
          String? body,
          String? payload,
          ) async {
        // Handle iOS notification click
        onNotificationClick(payload,'accept');
      },
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        final String? payload = response.payload;
        final String? actionId = response.actionId;

        // Handle notification response
        onNotificationClick(payload, 'accept');
      },
    );
  }

  // Method to schedule notifications
  Future<void> scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledNotificationDateTime,
  }) async {
    // Define action buttons
    const androidActions = [
      AndroidNotificationAction(
        'accept', // actionId
        'Accept', // button title
        allowGeneratedReplies: true,
        showsUserInterface: true
      ),
      AndroidNotificationAction(
        'reject', // actionId
        'Reject', // button title
        allowGeneratedReplies: false,
      ),
    ];

    // Define notification details for Android
    final androidNotificationDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.max,
      actions: androidActions, // Set actions here
    );

    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    // Schedule the notification
    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
      notificationDetails,
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // Method to handle notification click events

  Future<void> onNotificationClick(String? payload, String? actionId) async {
    if (actionId != null) {
      switch (actionId) {
        case 'accept':
          print('Accept button clicked');

          // Perform the desired action for the 'accept' button
          break;
        case 'reject':
          print('Reject button clicked');
          // Perform the desired action for the 'reject' button
          break;
        default:
          print('Unknown action button clicked');
          break;
      }
    }

    if (payload != null) {
      print('Notification payload: $payload');
    }
  }
}
////////////////////////////////////
// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   Future<void> initNotification() async {
//     // Initialization settings for Android
//     final AndroidInitializationSettings initializationSettingsAndroid =
//     const AndroidInitializationSettings('elder');
//
//     // Initialization settings for iOS
//     final initializationSettingsIOS = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: (
//           int id,
//           String? title,
//           String? body,
//           String? payload,
//           ) async {
//         onNotificationClick(payload);
//       },
//     );
//
//     final initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//
//     await notificationsPlugin.initialize(
//       initializationSettings,
//       //onSelectNotification: null,
//     );
//   }
//
//   Future<void> scheduleNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//     required DateTime scheduledNotificationDateTime,
//   }) async {
//     await notificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//      tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
//
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'channelId',
//           'channelName',
//           importance: Importance.max,
//           actions: [
//             AndroidNotificationAction("id", "title"),
//               AndroidNotificationAction(
//                 'accept', 'accept',
//                 allowGeneratedReplies: true,
//               ),
//             ],
//           priority: Priority.max,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
//
//   Future<void> onNotificationClick(String? payload) async {
//     if (payload != null) {
//       if (payload == 'accept') {
//         print("Accept action clicked");
//       }
//     }
//   }
// }
///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//     const AndroidInitializationSettings('elder');
//
//     var initializationSettingsIOS = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
//           onNotificationClick(payload);
//         });
//
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     await notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) async {
//           // Handle the notification response here
//           // Check the actionId to determine which action was clicked
//           final actionId = notificationResponse.actionId;
//           if (actionId == 'accept') {
//             onNotificationClick('accept');
//           }
//         });
//   }
//
//   NotificationDetails notificationDetails() {
//     return NotificationDetails(
//         android: AndroidNotificationDetails(
//             'channelId', 'channelName',
//             ongoing: true,
//             color: Colors.purple,
//             autoCancel: false,
//             actions: [
//               AndroidNotificationAction(
//                 'accept', 'Accept',
//                 allowGeneratedReplies: true,
//               ),
//             ],
//             importance: Importance.max,
//             priority: Priority.max),
//         iOS: const DarwinNotificationDetails());
//   }
//
//   Future<void> showNotification(
//       {int id = 0, String? title, String? body, String? payload}) async {
//     return notificationsPlugin.show(
//         id, title, body, await notificationDetails(),
//         payload: payload);
//   }
//
//   Future<void> scheduleNotification(
//       {int id = 0,
//         String? title,
//         String? body,
//         String? payload,
//         required DateTime scheduledNotificationDateTime}) async {
//     return notificationsPlugin.zonedSchedule(
//         id,
//         title,
//         body,
//         tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
//         await notificationDetails(),
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
//   }
//
//   Future<void> onNotificationClick(String? payload) async {
//     if (payload != null) {
//       if (payload == 'accept') {
//         print("ok in notification work");
//       } else {
//         print("Unhandled payload: $payload");
//       }
//     } else {
//       print("no payload");
//     }
//   }
// }
