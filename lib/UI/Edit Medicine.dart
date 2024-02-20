import 'package:finalproject1/CustomWidgets/check%20MedType.dart';
import 'package:finalproject1/CustomWidgets/edit%20TxtF.dart';
import 'package:flutter/material.dart';

class EditMedicine extends StatelessWidget {
  static final String routeName = "edit med";

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
        body: Column(
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
                Flexible(
                  child: EditTxtF(
                    title: '  Start Date',
                    hintTxt: 'Start',
                    width: 130,
                    iconTitle: Icons.date_range_outlined,
                    keyBoard: TextInputType.datetime,
                  ),
                ),
                Flexible(
                    child: EditTxtF(
                  title: '   End Date',
                  hintTxt: 'End',
                  width: 130,
                  iconTitle: Icons.date_range_outlined,
                  keyBoard: TextInputType.datetime,
                )),
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
    ]);
  }
}
