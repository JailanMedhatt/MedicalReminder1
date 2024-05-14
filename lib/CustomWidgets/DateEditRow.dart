import 'package:flutter/material.dart';

class DateEditRow extends StatelessWidget {
  String date;
  String title;

  DateEditRow({required this.date, required this.title});

  // late DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  // 'Start Date',
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
            Container(
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
                  date,
                  // '${selectedDate1.day}/${selectedDate1.month}/${selectedDate1.year}',
                  style: TextStyle(
                      color: Color(0x887E7E).withOpacity(0.99), fontSize: 21),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
