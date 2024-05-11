import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:date_field/date_field.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/Counter.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/Textfield.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/Date.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/RadioButton.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/Timee.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/colordropmenu.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/mydropmenu.dart';
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/FireBase/Models/Medicine.dart';
import 'package:finalproject1/providers/ReminderProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../NotificationService.dart';



class SchadualePage extends StatefulWidget {


  @override
  State<SchadualePage> createState() => _SchadualePageState();
}

class _SchadualePageState extends State<SchadualePage> {
  String name = '';
  String description = '';
  int n = 0;
  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();

  DateTime? selectedTime = DateTime.now();
  var formKey = GlobalKey<FormState>();
  late ReminderListProvider listProvider;
  void handleDateRangeChanged(DateTime? start, DateTime? end) {
    setState(() {
      startDate = start;
      endDate = end;
    });
  }
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();

    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'CareZone',
          channelName: 'Medicine Reminder',
          channelDescription: "3pills",
          importance: NotificationImportance.High,
          enableLights: true,
          enableVibration: true,
        ),
      ],
      debug: true,
    );
  }




  @override
  Widget build(BuildContext context) {
    listProvider= Provider.of<ReminderListProvider>(context);
    if(listProvider.MedicineList.isEmpty){
      listProvider.getAllMedicinesFromFireStore();
    }
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Opening.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 32,
              ),
            ),
            title: Text(
              'Schedule the Dose',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                child: Text(
                                  'What is the medicine name?',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 18,
                                  child: SizedBox(
                                    height: 45.0,
                                    child: TextFormField(
                                      onChanged: (text) {
                                        setState(() {
                                          name = text;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Medicine Type';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Color(0xffEDF2F3),
                                        filled: true,
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xffEDF2F3),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                child: Text(
                                  'About medicine',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextFormField(
                                  onChanged: (text) {
                                    setState(() {
                                      description = text;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Medicine Description';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffEDF2F3),
                                    filled: true,
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xffEDF2F3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      )

                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: DropdownMenuBottom(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Counter(n: n,onCountChanged: (newValue) {
                      setState(() {
                        n = newValue;
                      });
                    },),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: DateRangePickerControllerExample(onDateRangeChanged: handleDateRangeChanged,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DateTimeField(
                            //onTap: ()=> _selectTime(context),
                            value: selectedTime ?? DateTime.now(),
                            initialPickerDateTime: DateTime.now(),
                            //decoration:  InputDecoration(labelText: 'Enter Time'),
                            mode: DateTimeFieldPickerMode.time,
                            onChanged: (DateTime? value) {
                              if(value == null){
                                value = DateTime.now();
                                selectedTime = value;
                                print(value);
                              }
                              print(value);
                              setState(() {
                                selectedTime = value;
                              });
                            },

                          ),


                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Check(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PillDropMenu(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: addMedicine,

                        child: Text(
                          'Save',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff5D65B0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void addMedicine() {
    if (formKey.currentState?.validate() == true) {
      Medicine medicine = Medicine(
        NoOfPills: n,
        MedicineName: name,
        Description: description,
        StartDate: startDate,
        EndDate: endDate,
        time: selectedTime,
      );

      // Save medicine details to Firestore
      FireBaseUtills.addmedicineToFireStore(medicine).timeout(
        Duration(milliseconds: 500),
        onTimeout: () {
          print('added done');
          listProvider.getAllMedicinesFromFireStore();
          NotificationService().scheduleMedicineNotification(

           // repeatCount: 5,
            id: 1,
            title: 'Medicine Reminder',
            body: '${medicine.MedicineName} - ${medicine.NoOfPills} pills',
            scheduledNotificationDateTime: medicine.time!,

            medicineId: medicine.id,
            isDone: false,
          );
          //NotificationService().scheduleEndDateNotification(medicine.EndDate!);

          Navigator.pop(context);
        },
      );
    }
  }

}