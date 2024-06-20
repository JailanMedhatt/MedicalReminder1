
import 'package:finalproject1/CustomWidgets/ReminderWidget/Calender.dart';
import 'package:finalproject1/CustomWidgets/ReminderWidget/list.dart';
import 'package:finalproject1/CustomWidgets/ReminderWidget/slidable.dart';
import 'package:finalproject1/FireBase/Models/Medicine.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../FireBase/FirebaseUtills.dart';
import '../myTheme.dart';

class Reminder extends StatefulWidget {

  static final String routeName = "reminder-page";

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {



  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ListProvider>(context);
    String user = SharedPref.getId();
    var listProvider = Provider.of<ReminderListProvider>(context);

    //3lshan mdkholsh fe infinity loop
    if(listProvider.MedicineList.isEmpty){
     listProvider.getAllMedicinesFromFireStore(user);
    }
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image:  myProvider.getBackgroundImage(),
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
                  color: myProvider.isDarkMode()?
                      MyTheme.icondark
                      :
                  Color(0xff5D65B0),
                  size:40 ,
                ),
              ),
            ],
            title: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.reminder,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.notifications,
                  color: myProvider.isDarkMode()?
                  MyTheme.icondark
                      :
                  Color(0xff5D65B0),
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
                          Text(AppLocalizations.of(context)!.medicines,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                          ),

                        ],
                      ),
                    ),
              Expanded(
              child: ListView.builder(
                itemCount: listProvider.MedicineList.length,
                  itemBuilder: (context,index){
                    return CustomSlidable(medicine: listProvider.MedicineList[index]);
                  }

                // CustomSlidable(medicine: listProvider.MedicineList)),
              ),


          ),



      ],
                ), ), ]
    );

  }


}
