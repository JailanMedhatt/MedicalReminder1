import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DateEditRow extends StatefulWidget {
  String title;
  String date;

  DateEditRow({required this.title, required this.date});

  @override
  State<DateEditRow> createState() => _DateEditRowState();
}

class _DateEditRowState extends State<DateEditRow> {
  String selectedDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff5D65B0),
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.date_range_outlined,
                color: Color(0xff5D65B0),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              showCalendar();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xEDF2F3).withOpacity(0.99),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              //Type TextField
              width: 130,
              height: 40,
              child: Text(
                textAlign: TextAlign.center,
                '${widget.date}', // pass the hint text parameter here
                style: TextStyle(
                    color: Color(0x887E7E).withOpacity(0.99), fontSize: 21),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showCalendar() {
    var chosenDate = showDatePicker(
        context: context,
        barrierDismissible: false,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate as String;
      setState(() {});
    }
  }
}
