import 'dart:developer';


import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:finalproject1/utilsNotification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
// custom_notification.dart

import 'package:flutter/material.dart';

import 'FireBase/Models/UserAppointment.dart';

class NotificationService {
  Appointment? appointment;

  String? UserId;

  NotificationService({ this.appointment, this.UserId});


  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    // Initialize the time zones
    tz.initializeTimeZones();

    // Initialization settings for Android
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(
        'elder');

    // Initialization settings for iOS
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (int id,
          String? title,
          String? body,
          String? payload,) async {
        // Handle iOS notification click
        onNotificationClick(payload, 'accept');
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
        onNotificationClick(payload, actionId);
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
    String? Appointmentid,
    bool? isDone,
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
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation
          .absoluteTime,
    );
  }

  // Method to handle notification click events
  // w2ft henaaaa w accept bytb3
  //SharedPreferences sharedPreferences =
  Future onNotificationClick(String? payload, String? actionId) async {
    if (actionId != null) {
      switch (actionId) {
        case 'accept':
          print('Accept button clicked');
          //print("henaaaaaaaaaaaaaaaa");
          //print(UserId?? ""  +  appointment?.id??  + "henaaaaaaaaaaaaaa");
          //print("${UserId}++${appointment!.id}+ henaaaaaaaaaaaaaaaaaaaaaaaaaaa");
          /////////////////////////////////
          FireBaseUtills.editUAppointmentDetails(
              true, UserId ?? "", appointment?.id ?? "");
          //////////////////
          //Navigator.pushNamed(context, TaskListTab.routeName);
          //print("${UserId}++${appointment!.id}+ henaaaaaaaaaaaaaaaaaaaaaaaaaaa");
          //appointment?.isDone = true;
          bool giveTrue = true;
          print("${giveTrue}");

          return giveTrue;
          //print("${giveTrue}");
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
    return false;
  }

  // function btl3 bool mn onnotificationClick
  Future<bool> useOnNotificationClick() async {
    // Define the payload and actionId as needed
    String? payload = 'payload'; // Replace with actual payload
    String? actionId = 'accept'; // Replace with actual actionId ('accept', 'reject', etc.)

    // Call the onNotificationClick function and await the result
    bool result = await NotificationService().onNotificationClick(
        payload, actionId);

    // Now the result is a boolean variable with the returned value from onNotificationClick
    // You can use the result as needed
    print('Result of onNotificationClick: $result');

    // Use the result as needed in your application logic
    if (result) {
      print('The accept action was clicked.');
      return result;
      // Perform actions based on the true result
    } else {
      print('The action was not the accept button, or false was returned.');
      // Perform actions based on the false result
      return result;
    }
  }


//   Future<void> scheduleMedicineNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     required DateTime scheduledNotificationDateTime,
//     String? medicineId, // Change parameter name
//     bool? isDone,
//   }) async {
//     // Define notification details for Android
//     final androidNotificationDetails = AndroidNotificationDetails(
//       'channelId',
//       'channelName',
//       importance: Importance.max,
//       priority: Priority.max,
//       // Set other notification details as needed
//     );
//     final notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//     );
//
//     // Schedule the notification
//     await notificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
//       notificationDetails,
//       payload: medicineId, // Use medicine ID as payload
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
//   Future<void> scheduleEndDateNotification(DateTime endDate) async {
//     final now = DateTime.now();
//     final difference = endDate.difference(now);
//     final daysUntilEndDate = difference.inDays;
//
//     if (daysUntilEndDate > 0) {
//       // Schedule notification one day before the end date
//       final triggerDate = endDate.subtract(Duration(days: 1)); // Adjusted trigger date
//       await scheduleMedicineNotification(
//         id: 2,
//         title: 'Be Careful!',
//         body: 'Your medicine dosage ends tomorrow',
//         scheduledNotificationDateTime: triggerDate,
//         medicineId: '', // Provide the medicine ID if needed
//         isDone: false, // Set the notification status if needed
//       );
//     }
//   }
//
//
// }

  /// sotmet mra
  Future<void> scheduleMedicineNotification({
    int id = 0,
    String? title,
    String? body,
    required DateTime scheduledNotificationDateTime,
    required DateTime startDate,
    required DateTime endDate,
    String? medicineId,
    bool? isDone,
    required int repeatCount, // Number of times the notification should repeat per day
  }) async {
    // Initialize time zones
    tz.initializeTimeZones();

    // Convert scheduledNotificationDateTime to the local time zone
    final localTime = tz.TZDateTime.from(
      scheduledNotificationDateTime,
      tz.local,
    );

    // Determine the interval based on the repeatCount
    int x;
    switch (repeatCount) {
      case 1:
        x = 24;
        break;
      case 2:
        x = 12;
        break;
      case 3:
        x = 8;
        break;
      case 4:
        x = 6;
        break;
      case 5:
        x = 1; // A better value might be Duration(minutes: 288)
        break;
      default:
      // You can handle other repeatCount values here or set a default interval
        x = 24; // Default case: every 24 hours
        break;
    }

    // Calculate interval between each notification based on repeat count
    Duration interval = Duration(hours: x);

    // Calculate the number of days between startDate and endDate
    int numberOfDays = endDate.difference(startDate).inDays;

    // Notification details
    final androidNotificationDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.max,
      // Add other notification settings as needed
      // actions: [
      //   AndroidNotificationAction(
      //     'accept',
      //     'Accept',
      //     //callbackName: 'notificationAccept',
      //   ),
      // ],
    );

    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    // Loop to schedule notifications for each day within the range
    for (int day = 0; day <= numberOfDays; day++) {
      // Calculate the scheduled time for each notification on this day
      for (int i = 0; i < repeatCount; i++) {
        final scheduledTime = localTime.add(interval * i);
        final tzScheduledTime = tz.TZDateTime.from(
          scheduledTime.add(Duration(days: day)),
          tz.local,
        );

        // Check if the scheduled time falls within the specified date range
        if (tzScheduledTime.isAfter(startDate) && tzScheduledTime.isBefore(endDate)) {
          // Log the scheduled time for debugging
          print('Scheduling notification ID ${id + i} at local time: $tzScheduledTime, on ${tzScheduledTime.weekday}');

          try {
            // Schedule the notification
            await notificationsPlugin.zonedSchedule(
              id + i,
              title,
              body,
              tzScheduledTime,
              notificationDetails,
              payload: medicineId, // Use the medicine ID as payload
              androidAllowWhileIdle: true,
              uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
              matchDateTimeComponents: DateTimeComponents.time,
            );
            print('Successfully scheduled notification ID ${id + i}');
          } catch (e) {
            print('Failed to schedule notification ID ${id + i}: $e');
          }
        }
      }
    }
  }

}


///commeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeent

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