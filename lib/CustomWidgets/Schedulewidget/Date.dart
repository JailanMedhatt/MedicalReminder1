import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePickerControllerExample extends StatefulWidget {
  @override
  _DateRangePickerControllerExampleState createState() =>
      _DateRangePickerControllerExampleState();
}

class _DateRangePickerControllerExampleState
    extends State<DateRangePickerControllerExample> {
  late String _startDateTab1;
  late String _endDateTab1;
  late DateTime _selectedStartDateTab1;
  late DateTime _selectedEndDateTab1;

  late String _startDateTab2;
  late String _endDateTab2;
  late DateTime _selectedStartDateTab2;
  late DateTime _selectedEndDateTab2;

  @override
  void initState() {
    final DateTime today = DateTime.now();
    _selectedStartDateTab1 = today;
    _selectedEndDateTab1 = today.add(Duration(days: 3));
    _startDateTab1 =
        DateFormat('dd, MMMM yyyy').format(_selectedStartDateTab1).toString();
    _endDateTab1 =
        DateFormat('dd, MMMM yyyy').format(_selectedEndDateTab1).toString();

    _selectedStartDateTab2 = today;
    _selectedEndDateTab2 = today.add(Duration(days: 3));
    _startDateTab2 =
        DateFormat('dd, MMMM yyyy').format(_selectedStartDateTab2).toString();
    _endDateTab2 =
        DateFormat('dd, MMMM yyyy').format(_selectedEndDateTab2).toString();

    super.initState();
  }

  void selectionChangedTab1(DateTime? startDate, DateTime? endDate) {
    setState(() {
      _selectedStartDateTab1 = startDate ?? DateTime.now();
      _selectedEndDateTab1 = endDate ?? _selectedStartDateTab1;
      _startDateTab1 =
          DateFormat('dd, MMMM yyyy').format(_selectedStartDateTab1).toString();
      _endDateTab1 =
          DateFormat('dd, MMMM yyyy').format(_selectedEndDateTab1).toString();
    });
  }

  void selectionChangedTab2(DateTime? startDate, DateTime? endDate) {
    setState(() {
      _selectedStartDateTab2 = startDate ?? DateTime.now();
      _selectedEndDateTab2 = endDate ?? _selectedStartDateTab2;
      _startDateTab2 =
          DateFormat('dd, MMMM yyyy').format(_selectedStartDateTab2).toString();
      _endDateTab2 =
          DateFormat('dd, MMMM yyyy').format(_selectedEndDateTab2).toString();
    });
  }

  Future<void> _openDatePicker(BuildContext context,
      Function(DateTime?, DateTime?)
      selectionChanged) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectionChanged == selectionChangedTab1
          ? _selectedStartDateTab1
          : _selectedStartDateTab2,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      final DateTime? endDate = await showDatePicker(
        context: context,
        initialDate: picked,
        firstDate: picked,
        lastDate: DateTime(2100),
      );

      setState(() {
        if (endDate != null) {
          if (selectionChanged == selectionChangedTab1) {
            selectionChanged(picked, endDate);
          } else {
            selectionChangedTab2(picked, endDate);
          }
        }
      });
    }
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
                    Text(_startDateTab1),
                    GestureDetector(
                      child: Icon(
                          Icons.calendar_today, color: Color(0xff5D65B0)),
                      onTap: () {
                        _openDatePicker(context, selectionChangedTab1);
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
                    Text(_endDateTab2),
                    GestureDetector(
                      child: Icon(
                          Icons.calendar_today, color: Color(0xff5D65B0)),
                      onTap: () {
                        _openDatePicker(context, selectionChangedTab2);
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
}