import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePickerControllerExample extends StatefulWidget {
  @override
  _DateRangePickerControllerExampleState createState() =>
      _DateRangePickerControllerExampleState();
}

class _DateRangePickerControllerExampleState
    extends State<DateRangePickerControllerExample> {
  late String _startDate;
  late String _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd, MMMM yyyy').format(today).toString();
    _endDate = DateFormat('dd, MMMM yyyy')
        .format(today.add(Duration(days: 3)))
        .toString();
    _controller.selectedRange = PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('dd, MMMM yyyy').format(args.value.startDate).toString();
      _endDate = DateFormat('dd, MMMM yyyy')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _startDate,
                    ),
                    GestureDetector(
                      child: Icon(Icons.calendar_today, color: Color(0xff5D65B0)),
                      onTap: () {
                        _openDatePicker(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _endDate,
                    ),
                    GestureDetector(
                      child: Icon(Icons.calendar_today, color: Color(0xff5D65B0)),
                      onTap: () {
                        _openDatePicker(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 300,
            child: SfDateRangePicker(
              controller: _controller,
              onSelectionChanged: selectionChanged,
            ),
          ),
        );
      },
    );
  }
}