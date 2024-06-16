import 'package:finalproject1/CustomWidgets/ReminderWidget/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),      color: Color(
          0xffd5d5d5),
      ),
      margin: EdgeInsets.only(left: 10,right: 10,top: 15),
      padding: EdgeInsets.only(top: 20,bottom: 20,left: 5,right: 5),
      child: TimelineCalendar(
        calendarType: CalendarType.GREGORIAN,
        calendarLanguage: "en",
        calendarOptions: CalendarOptions(
          viewType: ViewType.DAILY,
          toggleViewType: true,
          headerMonthElevation: 0,
          headerMonthShadowColor: Colors.black26,
          headerMonthBackColor: Color(0x2d0def1),
          //bottomSheetBackColor: Colors.blueGrey
        ),
        dayOptions: DayOptions(
          //todayBackgroundColor:Color(0xfff8fdfe) ,
            compactMode: true,
            weekDaySelectedColor: Color(0xff5D65B0),
            disableDaysBeforeNow: true),
        headerOptions: HeaderOptions(
            weekDayStringType: WeekDayStringTypes.SHORT,
            monthStringType: MonthStringTypes.FULL,
            backgroundColor: const Color(0xd0def1),
            headerTextColor: Colors.black),
        onChangeDateTime: (datetime) {
          print(datetime.getDate());
        },
      ),
    );



  }
}
