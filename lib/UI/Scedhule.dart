
import 'package:finalproject1/CustomWidgets/Schedulewidget/Counter.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/Textfield.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/Date.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/RadioButton.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/Timee.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/colordropmenu.dart';
import 'package:finalproject1/CustomWidgets/Schedulewidget/mydropmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchadualePage extends StatelessWidget {
  static final String routeName = "scheduale-page";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Opening.png"),
                fit: BoxFit.cover,
              ),
            )),
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
                  )),
              title: Text(
                'scheduale the dose',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: SchadualePgae(
                        hint: 'name',
                        text: 'What is the medicine name ?',
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: SchadualePgae(
                        hint: 'Description',
                        text: 'About medicine',
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: DropdownMenuBottom()),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Counter(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: DateRangePickerControllerExample(),

                  ),
                  Padding(padding: EdgeInsets.only(top: 8),
                    child: Time(),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8),
                    child: Check(),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8),
                    child: PillDropMenu(),
                  ),
                  Padding(padding: EdgeInsets.all(8),
                      child: Container(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(onPressed: (){

                        }, child: Text(
                          'Save', textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),

                        ),
                          style: ButtonStyle(
                              backgroundColor:MaterialStatePropertyAll<Color>(Color(0xff5D65B0))
                          ),

                        ),
                      )
                  ),


                ]),
              ),
            )),
      ],
    );
  }
}
