import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../CustomWidgets/BottomSheetAppointment.dart';
import '../NotificationService.dart';
import '../SharedPref.dart';
import '../ViewModels/Profile/ProfileStates.dart';
import '../ViewModels/Profile/ProfileViewModel.dart';
import '../providers/list_provider.dart';
import 'DoctorWidget.dart';

class TaskListTab extends StatefulWidget {
  static const String routeName = 'task_list_tab';


  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  @override

  Widget build(BuildContext context) {
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
              Image.asset(
                'assets/images/bk.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
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
                        'Appointments',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      //SizedBox(width: 90),
                      Spacer(),
                      Icon(Icons.add_alert, color: Colors.deepPurple, size: 35),
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
                    monthColor: Colors.black,
                    dayColor: Colors.black,
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor: Colors.deepPurple,
                    dotsColor: Colors.deepPurple,
                    selectableDayPredicate: (date) => true,
                    locale: 'en_ISO',
                  ),
                  //SizedBox(height: 20),
                  // Doctor Appointments

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
                context: context,
                builder: (context) => BottomSheetAppointment(),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.deepPurple.withOpacity(0.8),
            shape: CircleBorder(), // Add this line to make it circular without a border
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      }

  }



