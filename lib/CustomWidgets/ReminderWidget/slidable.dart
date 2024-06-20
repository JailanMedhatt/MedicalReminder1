import 'package:finalproject1/CustomWidgets/ReminderWidget/list.dart';
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../FireBase/Models/Medicine.dart';
import '../../UI/Edit Medicine.dart';
import '../../myTheme.dart';



class CustomSlidable extends StatefulWidget {
  Medicine medicine;

  CustomSlidable({
    required this.medicine,
  });

  @override
  State<CustomSlidable> createState() => _CustomSlidableState();
}

class _CustomSlidableState extends State<CustomSlidable> {
  @override
  Widget build(BuildContext context) {
    bool? radioValue = false;
    //var listProvider = Provider.of<ListProvider>(context);

    var myProvider = Provider.of<ListProvider>(context);
    String user = SharedPref.getId();
    var listProvider = Provider.of<ReminderListProvider>(context);

    if (listProvider.MedicineList.isEmpty) {
      listProvider.getAllMedicinesFromFireStore(user);
    }

    return Container(
      margin: EdgeInsets.only(left: 20),
      child:

           Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.circular(25),
                  onPressed: (context) {
                    FireBaseUtills.deleteMedicine(widget.medicine, user)
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
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(EditMedicine.routeName, arguments: widget.medicine);
              },
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 8, bottom: 8, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: myProvider.isDarkMode()?
                  MyTheme.p.withOpacity(0.80)
                      :
                  Colors.grey[350],
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: FaIcon(
                                FontAwesomeIcons.pills,
                                size: 30,
                                color:myProvider.isDarkMode()?
                                MyTheme.icondark
                                    :
                                Color(0xff5D65B0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "${widget.medicine?.time?.hour.toString().padLeft(2, '0')}:${widget.medicine.time?.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: myProvider.isDarkMode()?
                            MyTheme.whiteColor
                                :
                            Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 7.0,
                            top: 7,
                            bottom: 7,
                            right: 7,
                          ),
                          child: Text(
                            "",
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                widget.medicine.MedicineName ?? 'oo',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.medicine.NoOfPills.toString()} Pills',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Row(
                              children: [
                                Radio<bool?>(
                                  value: true,
                                  groupValue: radioValue,
                                  activeColor: myProvider.isDarkMode()?
                                  MyTheme.icondark
                                      :
                                  Color(0xff5D65B0),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      radioValue = value;
                                    });
                                  },
                                ),
                                Text(
                                  AppLocalizations.of(context)!.taken,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: myProvider.isDarkMode()?
                                    MyTheme.icondark
                                        :
                                    Color(0xff5D65B0),
                                  ),
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
          )

        //itemCount: listProvider.MedicineList.length,

    );
  }
}