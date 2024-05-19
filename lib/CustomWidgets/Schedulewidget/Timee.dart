import 'package:finalproject1/myTheme.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Time extends StatefulWidget {
  // final ValueChanged<TimeOfDay> onTimeChanged;
  //
  // Time({required this.onTimeChanged});

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 0);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });

      // Pass the selected time back to the parent widget
      //widget.onTimeChanged(_time);
    }
  }

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.time,
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
              child: Row(
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
                    child: Icon(Icons.timelapse,
                        color:
                    Color(0xff5D65B0)),
                    onTap: _selectTime,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
