import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../myTheme.dart';
import '../providers/list_provider.dart';

class DateEditRow extends StatelessWidget {
  String date;
  String title;

  DateEditRow({required this.date, required this.title});

  // late DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Row(
      children: [

        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,bottom: 12),
                  child: Text(
                    title,
                    // 'Start Date',
                    style: TextStyle(
                        fontSize: 22,
                        color:listProvider.isDarkMode()?
                        MyTheme.whiteColor
                            :
                        Color(0xff5D65B0),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: listProvider.isDarkMode()?
                MyTheme.n.withOpacity(0.80)
                    :
                Color(0xEDF2F3).withOpacity(0.99),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: listProvider.isDarkMode()?
                    Colors.transparent
                        :
                    Colors.grey,
                    blurRadius: 4,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              //width: 130,
              //height: 33,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 8),
                  child: Text(
                    date,
                    // '${selectedDate1.day}/${selectedDate1.month}/${selectedDate1.year}',
                    style: TextStyle(
                        color: listProvider.isDarkMode()?
                        MyTheme.whiteColor
                            :
                        Color(0x887E7E).withOpacity(0.99), fontSize: 21),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
