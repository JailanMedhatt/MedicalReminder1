import 'package:finalproject1/CustomWidgets/check%20MedType.dart';
import 'package:finalproject1/CustomWidgets/custom%20EditDateRow.dart';
import 'package:finalproject1/CustomWidgets/edit%20TxtF.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditMedicine extends StatefulWidget {
  static final String routeName = "edit med";

  @override
  State<EditMedicine> createState() => _EditMedicineState();
}

class _EditMedicineState extends State<EditMedicine> {
  String selectedDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bk.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 32)),
            title: Text(
              'Edit Medicine',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            )),
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 18,
              ),
              EditTxtF(title: 'Medicine Name', hintTxt: 'Name'),
              EditTxtF(
                title: 'Time',
                hintTxt: '00-00',
                iconTitle: Icons.timer_outlined,
                keyBoard: TextInputType.numberWithOptions(),
              ),
              EditTxtF(
                title: 'Dosage Of Medicine ',
                hintTxt: '2',
                iconTitle: Icons.medication_liquid_sharp,
                keyBoard: TextInputType.number,
              ),
              Row(
                children: [
                  DateEditRow(
                    title: 'Start Date',
                    date: '${selectedDate}',
                  ),
                  DateEditRow(
                    title: 'End Date',
                    date: '${selectedDate}',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '   Medicine Type',
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff5D65B0),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2,
              ),
              CheckMedType(
                type: ' Syrup',
                IMG: "assets/images/Syrup.png",
              ),
              CheckMedType(
                type: ' Pills',
                IMG: "assets/images/Pills.png",
              ),
              CheckMedType(
                type: ' Syringe',
                IMG: "assets/images/Syringe.png",
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff5D65B0)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      elevation: MaterialStateProperty.all(9),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ))),
                  child: Text(
                    'SAVE',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
