import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../CustomWidgets/BottomSheetAppointment.dart';
import '../NotificationService.dart';
import '../SharedPref.dart';
import '../ViewModels/Profile/ProfileStates.dart';
import '../ViewModels/Profile/ProfileViewModel.dart';
import '../myTheme.dart';
import '../providers/list_provider.dart';
import 'DoctorWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskListTab extends StatefulWidget {
  static const String routeName = 'task_list_tab';


  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  @override

  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    String user = SharedPref.getId();
    var MyProvider = Provider.of<AppointmentProvider>(context);
    if(MyProvider.appointmentList.isEmpty){
      MyProvider.getAppointmentsFromFireStore(user);
    }

        return Scaffold(
          body:
          Stack(
            fit: StackFit.expand,
            children: [
             Container(
               decoration:  BoxDecoration(
                 image:listProvider.getBackgroundImage(),),
             ),
              Column(
                children: [
                  SizedBox(height: 70),
                  Row(
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back, size: 32)),
                      SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context)!.appointment,
                        style: Theme.of(context).textTheme.titleLarge,
                        //TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900,),
                      ),
                      //SizedBox(width: 90),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.add_alert, color:
                        listProvider.isDarkMode()?
                            MyTheme.icondark
                            :
                        Colors.deepPurple, size: 35),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  CalendarTimeline(
                    initialDate: MyProvider.selectDate,
                    firstDate: DateTime.now().subtract(Duration(days: 365)),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    onDateSelected: (date) {
                      MyProvider.changeSelectDate(date,user);
                    },
                    leftMargin: 20,
                    monthColor: listProvider.isDarkMode()?
                        MyTheme.whiteColor
                        :
                    Colors.black,
                    dayColor:
                    listProvider.isDarkMode()?
                    MyTheme.whiteColor
                        :Colors.black,
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor: listProvider.isDarkMode()?
                    MyTheme.icondark
                        :
                    Colors.deepPurple,
                    dotsColor: listProvider.isDarkMode()?
                    MyTheme.icondark
                        :
                    Colors.deepPurple,
                    selectableDayPredicate: (date) => true,
                    locale: 'en_ISO',
                  ),
                  //SizedBox(height: 20),
                  // Doctor Appointments
                  MyProvider.appointmentList.isEmpty ?
                  Container(child: Column(
                    children: [
                      Image.asset("assets/images/alaRM.png"),
                      Center(child: Text("There is no appointmnet added for today",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                    ],
                  ),) :
                  Expanded(child:
                    ListView.builder(itemBuilder: (context, index) {
                    return
                      DoctorWidget(appointment: MyProvider
                          .appointmentList[index]);
                  },
                    itemCount: MyProvider.appointmentList.length,
                  )
                  ),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(

            onPressed: () {
              showModalBottomSheet(
                enableDrag: true,
                isScrollControlled: true,
                constraints: BoxConstraints.tight(
                    Size(
                        MediaQuery.sizeOf(context)
                            .width,
                        600.h)),
                context: context,
                builder: (context) => BottomSheetAppointment(),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: listProvider.isDarkMode()?
            MyTheme.icondark
                :
            Colors.deepPurple.withOpacity(0.8),
            shape: CircleBorder(), // Add this line to make it circular without a border
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      }

  }



