import 'package:finalproject1/CustomWidgets/ReminderWidget/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
        viewType: ViewType.DAILY,
        toggleViewType: true,
        headerMonthElevation: 10,
        headerMonthShadowColor: Colors.black26,
        headerMonthBackColor: Colors.transparent,
      ),
      dayOptions: DayOptions(
          compactMode: true,
          weekDaySelectedColor: Color(0xff5D65B0),
          disableDaysBeforeNow: true),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: const Color(0xffEDF2F3),
          headerTextColor: Colors.black),
      onChangeDateTime: (datetime) {
        print(datetime.getDate());
      },
    );



  }
}
