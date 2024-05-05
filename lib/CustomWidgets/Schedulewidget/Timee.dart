
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {_time = newTime;
      });
    }
  }Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Time',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 12,
          ),
          Material(
            color: Colors.transparent,
            elevation: 18,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0xffEDF2F3),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${_time.format(context)}',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Icon(Icons.timelapse, color: Color(0xff5D65B0)),
                    onTap: () {
                      _selectTime();
                    },
                  )
                ],
              ), ), ),
        ], ),
    );



  }
}
