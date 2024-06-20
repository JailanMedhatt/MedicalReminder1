

import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../FireBase/Models/UserAppointment.dart';
import '../NotificationService.dart';
import '../SharedPref.dart';
import '../ViewModels/Profile/ProfileViewModel.dart';
import '../providers/list_provider.dart';

class DoctorWidget extends StatefulWidget {
  Appointment appointment;

  DoctorWidget({
    required this.appointment
  });

  @override
  State<DoctorWidget> createState() => _DoctorWidgetState();
}

class _DoctorWidgetState extends State<DoctorWidget> {
 // Future<bool> isChecked = NotificationService().useOnNotificationClick();
  bool isChecked = false;


   someFunction() async {
    isChecked = await NotificationService().useOnNotificationClick();
    // Use the isChecked value in your code
    if (isChecked) {
      Icons.check_circle ;
      print("icon mfrod tat3ml");
      return true;

    } else {
      Icons.circle_outlined;
    }
  }

  Future<bool> getNotificationChecked() async {
    bool isChecked = await NotificationService().useOnNotificationClick();
    return isChecked;
  }


  @override
  Widget build(BuildContext context) {
    String? user = SharedPref.getId();
    var listProvider = Provider.of<AppointmentProvider>(context);
      return Container(
        margin: EdgeInsets.only(left: 20),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.25,
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(25),
                key: const ValueKey(0),
                onPressed: (context) {
                  //henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                  FireBaseUtills.deleteAppointment(widget.appointment,user??"")
                      .then((value) {

                  })

                      .timeout(
                      Duration(milliseconds: 500),
                      onTimeout: () {
                        print("Deleted aywa");
                        listProvider.getAppointmentsFromFireStore(user??"");
                      }
                  );
                  // FireBase.DeleteTask(
                  //     widget.task, authprovider.currentUser!.id!)
                  //     .timeout(Duration(milliseconds: 200),
                  //     onTimeout: () {
                  //       print('Deleted');
                  //       provider.getTasksDataFromFire(
                  //           authprovider.currentUser!.id!);
                  //     });
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),

          child: Container(
            margin: EdgeInsets.only(right: 20, top: 8, bottom: 8),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[350],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FaIcon(
                        FontAwesomeIcons.userMd,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 7.0, top: 7, bottom: 7, right: 7),
                      child: Text(
                        //appointment.time != null ? appointment.time.toString() : '',
                        //appointment.time!.hour.toString(),
                        "${widget.appointment?.time?.hour.toString().padLeft(
                            2, '0')}:${widget.appointment.time?.minute.toString()
                            .padLeft(2, '0')}",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),

                Expanded(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            widget.appointment.DoctorName ?? "",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.appointment.Speciality ?? "",
                            style: TextStyle(color: Color(0xff444444), fontSize: 15),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[350],
                              child:
                              IconButton(
                                icon:
                                Icon(
                                  //if(){}
                                  //NotificationService().onNotificationClick == true

                                  widget!.appointment!.isDone! ? Icons.check_circle : Icons.circle_outlined,
                                  //await isChecked ? Icons.check_circle : Icons.circle_outlined,

                                  color: Colors.deepPurple,
                                  size: 30,
                                ),
                                onPressed: () {

                                  setState(() {
                                    //AppointmentProvider.isDone = true;
                                    //someFunction();
                                    widget!.appointment!.isDone = true;
                                   // ! widget!.appointment!.isDone!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              widget!.appointment!.isDone! ? 'Done' : 'Confirm',
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

//Future<bool> isChecked = NotificationService().useOnNotificationClick();
  // Future<bool> getNotificationChecked() async {
  //   bool isChecked = await NotificationService().useOnNotificationClick();
  //   return isChecked;
  // }
}


// class CircleButtonWithText extends StatefulWidget {
//   @override
//   _CircleButtonWithTextState createState() => _CircleButtonWithTextState();
// }
//
// class _CircleButtonWithTextState extends State<CircleButtonWithText> {
//   bool isChecked = false;
//
//   Future<void> initializeCheckedState() async {
//     // Call the NotificationService's onNotificationClick and await its result
//     // If the method signature or behavior of NotificationService has changed, please review it
//     final bool? rees = (await NotificationService().useOnNotificationClick()) as bool?;
//
//     // Update isChecked based on the result from onNotificationClick, making sure the result is boolean
//     if (rees != null) {
//       setState(() {
//         isChecked = rees;
//       });
//     } else {
//       // Handle the case where the result is null or invalid
//       setState(() {
//         isChecked = false;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: Colors.grey[350],
//           child: IconButton(
//             icon: Icon(
//               isChecked ? Icons.check_circle : Icons.circle_outlined,
//               color: Colors.deepPurple,
//               size: 30,
//             ),
//             onPressed: () {
//               setState(() {
//                 isChecked = !isChecked;
//               });
//             },
//           ),
//         ),
//         SizedBox(width: 5),
//         Text(
//           isChecked ? 'Done' : 'Confirm',
//           style: TextStyle(color: Colors.deepPurple),
//         ),
//       ],
//     );
//   }
// }




class CircleButtonWithText extends StatefulWidget {
  @override
  _CircleButtonWithTextState createState() => _CircleButtonWithTextState();
}

class _CircleButtonWithTextState extends State<CircleButtonWithText> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[350],
          child: IconButton(
            icon: Icon(
              //if(){}
              //NotificationService().onNotificationClick == true
              isChecked? Icons.check_circle : Icons.circle_outlined,
              color: Colors.deepPurple,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                //AppointmentProvider.isDone = true;
                isChecked = !isChecked;
              });
            },
          ),
        ),
        SizedBox(width: 5),
        Text(
          isChecked ? 'Done' : 'Confirm',
          style: TextStyle(color: Colors.deepPurple),
        ),
      ],
    );
  }
}


