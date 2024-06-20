import 'package:finalproject1/CustomWidgets/ReminderWidget/list.dart';
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/providers/ReminderProvider.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../FireBase/Models/Medicine.dart';



class CustomSlidable extends StatelessWidget {
  Medicine medicine;

  CustomSlidable({
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ListProvider>(context);
    String user = SharedPref.getId();
    var listProvider = Provider.of<ReminderListProvider>(context);

    if (listProvider.MedicineList.isEmpty) {
      listProvider.getAllMedicinesFromFireStore(user);
    }

    return Container(
      margin: EdgeInsets.only(left: 20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.circular(25),
                  onPressed: (context) {
                    FireBaseUtills.deleteMedicine(medicine, user)
                        .then((value) {
                      // Handle delete appointment
                    }).timeout(
                      Duration(milliseconds: 500),
                      onTimeout: () {
                        print("Deleted successfully");
                        listProvider.getAllMedicinesFromFireStore(user);
                      },
                    );
                  },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete'
                ),
              ],
            ),
            child: CustomList(medicine: listProvider.MedicineList[index]),
          );
        },
        itemCount: listProvider.MedicineList.length,
      ),
    );
  }
}