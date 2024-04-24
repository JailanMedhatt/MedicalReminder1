

import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../FireBase/Models/UserAppointment.dart';
import '../providers/list_provider.dart';

class DoctorWidget extends StatelessWidget {


  Appointment appointment;

  DoctorWidget({
    required this.appointment
  });

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
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
                FireBaseUtillsAppointment.deleteAppointment(appointment).timeout(
                  Duration(milliseconds: 500),
                  onTimeout: (){
                    print("Deleted aywa");
                    listProvider.getAppointmentsFromFireStore();

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
          margin: EdgeInsets.only(right:  20, top: 8,bottom: 8),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[350],
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: FaIcon(
                      FontAwesomeIcons.userMd,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 7.0,top: 7,bottom: 7,right: 7),
                    child: Text(
                      //appointment.time != null ? appointment.time.toString() : '',
                      //appointment.time!.hour.toString(),
                  "${appointment?.time?.hour.toString().padLeft(2, '0')}:${appointment.time?.minute.toString().padLeft(2, '0')}",
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
                          appointment.DoctorName??"",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          appointment.Speciality??"",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: CircleButtonWithText(),
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
}

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
              isChecked ? Icons.check_circle : Icons.circle_outlined,
              color: Colors.deepPurple,
              size: 30,
            ),
            onPressed: () {
              setState(() {
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
