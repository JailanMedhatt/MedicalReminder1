import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePickerControllerExample extends StatefulWidget {
  final Function(DateTime?, DateTime?) onDateRangeChanged; // Callback function

  DateRangePickerControllerExample({required this.onDateRangeChanged});

  @override
  _DateRangePickerControllerExampleState createState() =>
      _DateRangePickerControllerExampleState();
}

class _DateRangePickerControllerExampleState
    extends State<DateRangePickerControllerExample> {
  DateTime? _selectedStartDate = DateTime.now();
  DateTime? _selectedEndDate = DateTime.now()?.add(Duration(days: 3));
  late String _startDateFormatted = DateFormat('dd, MMMM yyyy').format(_selectedStartDate!);
  late String _endDateFormatted = DateFormat('dd, MMMM yyyy').format(_selectedEndDate!);

  @override
  void initState() {
    super.initState();
  }

  void _onDateRangeChanged(DateTime? startDate, DateTime? endDate) {
    setState(() {
      _selectedStartDate = startDate;
      _selectedEndDate = endDate;

      _startDateFormatted = DateFormat('dd, MMMM yyyy').format(_selectedStartDate!);
      _endDateFormatted = DateFormat('dd, MMMM yyyy').format(_selectedEndDate!);

      // Call the callback function to pass selected dates
      widget.onDateRangeChanged(_selectedStartDate, _selectedEndDate);
    });
  }

  Future<void> _openDatePicker(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: _selectedStartDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedStartDate != null) {
      final DateTime? pickedEndDate = await showDatePicker(
        context: context,
        initialDate: _selectedEndDate!,
        firstDate: pickedStartDate,
        lastDate: DateTime(2100),
      );

      if (pickedEndDate != null) {
        _onDateRangeChanged(pickedStartDate, pickedEndDate);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Start date picker
          Text(
            AppLocalizations.of(context)!.start_Date,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          GestureDetector(
            onTap: () {
              _openDatePicker(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_startDateFormatted),
                Icon(Icons.calendar_today, color: Color(0xff5D65B0)),
              ],
            ),
          ),

          // End date picker
          SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.end_Date,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          GestureDetector(
            onTap: () {
              _openDatePicker(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_endDateFormatted),
                Icon(Icons.calendar_today, color: Color(0xff5D65B0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
