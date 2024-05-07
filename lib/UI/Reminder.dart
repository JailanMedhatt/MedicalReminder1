
import 'package:finalproject1/CustomWidgets/ReminderWidget/Calender.dart';
import 'package:finalproject1/CustomWidgets/ReminderWidget/list.dart';
import 'package:finalproject1/providers/ReminderProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reminder extends StatefulWidget {
  static final String routeName = "reminder-page";

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ReminderListProvider>(context);
    //3lshan mdkholsh fe infinity loop
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
            actions: [
              IconButton(
                onPressed: () {
                  // Code for magnifier icon functionality
                },
                icon: Icon(
                  Icons.search_sharp,
                  color: Color(0xff5D65B0),
                  size:40 ,
                ),
              ),
            ],
            title: Row(
              children: [
                Text(
                  'Reminder',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.notifications,
                  color: Color(0xff5D65B0),
                  size: 32,
                ),

              ],
            ),

          ),
          body: Column(
            children: [
              Calendar(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Medicines',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                          ),

                        ],
                      ),
                    ),
              Expanded(child:
              ListView.builder(itemBuilder:(context , index){
                return  CustomList(medicine: listProvider.MedicineList[index]);
              },
                itemCount: listProvider.MedicineList.length,
              )
              ),







            ],
          ),


        ),
      ],
    );
  }


}
