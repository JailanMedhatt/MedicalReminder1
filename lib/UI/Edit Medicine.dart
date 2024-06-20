import 'package:finalproject1/CustomWidgets/check%20MedType.dart';
import 'package:finalproject1/CustomWidgets/edit%20TxtF.dart';
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/UI/dosageTxtField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../CustomWidgets/DateEditRow.dart';
import '../DialogUtills.dart';
import '../FireBase/Models/Medicine.dart';
import '../myTheme.dart';
import '../providers/list_provider.dart';

class EditMedicine extends StatefulWidget {
 
  static final String routeName = "edit med";

  // DateTime selectedDate = DateTime.now();

  @override
  State<EditMedicine> createState() => _EditMedicineState();
}

class _EditMedicineState extends State<EditMedicine> {
  // String selectedDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  var formKey = GlobalKey<FormState>();
  late ReminderListProvider listProvider;
  var mednamecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var dosagecontroller = TextEditingController();
  Medicine? medicine;

  @override
  Widget build(BuildContext context) {
    if (medicine == null) {
      // Remove 'var' to refer to the class-level 'medicine' variable
      medicine = ModalRoute.of(context)?.settings.arguments as Medicine;
      mednamecontroller.text = medicine!.MedicineName ?? "";
      timecontroller.text =
          "${medicine!.time!.hour.toString()}:${medicine!.time!.minute.toString()}";
      dosagecontroller.text = medicine!.NoOfPills.toString();
      selectedDate1 = medicine!.StartDate!;
      selectedDate2 = medicine!.EndDate!;
    }
    var myProvider =  Provider.of<ListProvider>(context);
    String user = SharedPref.getId();
    listProvider = Provider.of<ReminderListProvider>(context);
    return Stack(children: [
      Container(
        decoration:  BoxDecoration(
          image:myProvider.getBackgroundImage() ,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // scrolledUnderElevation: 0,
          // elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 32)),
            title: Text(
              AppLocalizations.of(context)!.edit_Medicine,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            )),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
                child: EditTxtF(
                  title: AppLocalizations.of(context)!.medicine_Name,
                  controller: mednamecontroller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
                child: EditTxtF(
                  title: AppLocalizations.of(context)!.time,
                  controller: timecontroller,
                  iconTitle: Icons.timer_outlined,
                  keyBoard: TextInputType.numberWithOptions(),
                ),
              ),
              DoseTxtF(controller: dosagecontroller),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          showCalendar();
                        },
                        child: DateEditRow(
                          title: AppLocalizations.of(context)!.start_Date,
                          date:
                              '${selectedDate1.day}/${selectedDate1.month}/${selectedDate1.year}',
                        )),

                    InkWell(
                        onTap: () {
                          showCalendar2();
                        },
                        child: DateEditRow(
                          title: AppLocalizations.of(context)!.end_Date,
                          date:
                              '${selectedDate2.day}/${selectedDate2.month}/${selectedDate2.year}',
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Text(
                  AppLocalizations.of(context)!.medicine_Type,
                  style: TextStyle(
                      fontSize: 22,
                      color:
                      myProvider.isDarkMode()?
                      MyTheme.whiteColor
                          :
                      Color(0xff5D65B0),
                      fontWeight: FontWeight.w600),
                ),
              ),
              CheckMedType(),
              Padding(
                padding: const EdgeInsets.only(left: 29, right: 29, bottom: 12),
                child: ElevatedButton(
                  onPressed: () {
                    editMedicine();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff5D65B0)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      elevation: MaterialStateProperty.all(9),
                      padding: MaterialStateProperty.all(EdgeInsets.all(3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ))),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: selectedDate1,
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate1 = chosenDate;
      setState(() {});
    }
  }

  void showCalendar2() async {
    var chosenDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: selectedDate2,
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate2 = chosenDate;
      setState(() {});
    }
  }

  void editMedicine() {
    String user = SharedPref.getId();
    if (formKey.currentState?.validate() == true) {
      if (medicine != null) {
        // Accessing properties and methods of medicine, ensuring it's not null
        medicine!.MedicineName = mednamecontroller.text;

        // Parsing time from string to DateTime
        DateTime? newTime;
        try {
          final List<String> timeComponents = timecontroller.text.split(':');
          if (timeComponents.length == 2) {
            final int hours = int.parse(timeComponents[0]);
            final int minutes = int.parse(timeComponents[1]);
            newTime = DateTime(medicine!.time!.year, medicine!.time!.month,
                medicine!.time!.day, hours, minutes);
          } else {
            throw FormatException('Invalid time format');
          }
        } catch (e) {
          print('Error parsing time: $e');
          // Handle the case where time format is invalid
          return; // Exit the function early to prevent further execution
        }

        // Assigning new time to medicine
        if (newTime != null) {
          medicine!.time = newTime;
        } else {
          print('New time is null!');
          return; // Exit the function early if newTime is null
        }

        medicine!.StartDate = selectedDate1;
        medicine!.EndDate = selectedDate2;

        // Parsing dosage from string to integer
        int? dosage;
        try {
          dosage = int.parse(dosagecontroller.text);
        } catch (e) {
          print('Error parsing dosage: $e');
          // Handle the case where dosage is not a valid integer
          return; // Exit the function early to prevent further execution
        }

        // Assigning parsed dosage to medicine
        medicine!.NoOfPills = dosage!;

        DialogUtills.showLoading(context);

        FireBaseUtills.editMedicineReminder(medicine!,user).then((value) {
          DialogUtills.hideLoading(context);
        }).timeout(Duration(milliseconds: 500), onTimeout: () {
          print('success');
          listProvider.getAllMedicinesFromFireStore(user);
          Navigator.pop(context);
        });
      } else {
        // Handle the case when medicine is null
        print('Medicine is null!');
        // Optionally, you can show a message to the user or perform other actions
      }
    }
  }
}
