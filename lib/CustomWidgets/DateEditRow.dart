import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../FireBase/Models/Medicine.dart';
import '../providers/ReminderProvider.dart';

class DateEditRow extends StatefulWidget {
  @override
  State<DateEditRow> createState() => _DateEditRowState();
}

class _DateEditRowState extends State<DateEditRow> {
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  late ReminderListProvider listProvider;
  Medicine? medicine;

  // late DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    if (medicine == null) {
      var medicine = ModalRoute.of(context)?.settings.arguments as Medicine;

      selectedDate1 = medicine!.StartDate!;
      selectedDate2 = medicine!.EndDate!;
    }
    listProvider = Provider.of<ReminderListProvider>(context);
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Start Date',
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
                  width: 130,
                  height: 33,
                  child: Center(
                    child: Text(
                      '${selectedDate1.day}/${selectedDate1.month}/${selectedDate1.year}',
                      style: TextStyle(
                          color: Color(0x887E7E).withOpacity(0.99),
                          fontSize: 21),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 70,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'End Date',
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
                  showCalendar2();
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
                  width: 130,
                  height: 33,
                  child: Center(
                    child: Text(
                      '${selectedDate2.day}/${selectedDate2.month}/${selectedDate2.year}',
                      style: TextStyle(
                          color: Color(0x887E7E).withOpacity(0.99),
                          fontSize: 21),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> showCalendar() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: selectedDate1,
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      setState(() {
        selectedDate1 = chosenDate;
      });
    }
  }

  Future<void> showCalendar2() async {
    var chosenDate = await showDatePicker(
      context: context,
      firstDate: selectedDate2,
      initialDate: selectedDate2,
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      setState(() {
        selectedDate2 = chosenDate;
      });
    }
  }
}
