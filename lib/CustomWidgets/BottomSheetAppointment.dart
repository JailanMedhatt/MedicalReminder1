import 'package:date_field/date_field.dart';
import 'package:finalproject1/DialogUtills.dart';
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/FireBase/Models/UserAppointment.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../NotificationService.dart';
import '../providers/list_provider.dart';



class BottomSheetAppointment extends StatefulWidget {
  @override
  _BottomSheetAppointmentState createState() => _BottomSheetAppointmentState();
}

class _BottomSheetAppointmentState extends State<BottomSheetAppointment> {

  var  formKey = GlobalKey<FormState>();

  DateTime? selectedTime = DateTime.now();
  String? doctorName;
  DateTime? time ;
  String? speciality;
  DateTime selectedDate = DateTime.now();
  late AppointmentProvider listProvider;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final DateTime selectedDateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        picked.hour,
        picked.minute,
      );

      setState(() {
        selectedDate = selectedDateTime;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ListProvider>(context);
     listProvider = Provider.of<AppointmentProvider>(context);
    return Container(
      //height: 600.h,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:  myProvider.isDarkMode()?
        MyTheme.backgroundDark.withOpacity(0.8)
            :
        Colors.deepPurple.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(27.0),
          topRight: Radius.circular(27.0),
        ),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.add_Appointment,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                onChanged: (text){
                  doctorName = text;
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.doctor_is_Name,
                  fillColor: myProvider.isDarkMode()?
                      MyTheme.p2.withOpacity(0.8)
                      :
                  Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a doctor\'s name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  doctorName = value;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.time,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color:
                            myProvider.isDarkMode()?
                            MyTheme.p2.withOpacity(0.8)
                                :
                            Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DateTimeField(
                            //onTap: ()=> _selectTime(context),
                            value: selectedTime ?? DateTime.now(),
                            initialPickerDateTime: DateTime.now(),
                            //decoration:  InputDecoration(labelText: 'Enter Time'),
                            mode: DateTimeFieldPickerMode.time,
                            onChanged: (DateTime? value) {
                              if(value == null){
                                value = DateTime.now();
                                selectedTime = value;
                                print(value);
                              }
                              print(value);
                              setState(() {
                                selectedTime = value;
                              });
                            },

                          ),

                          // TextFormField(
                          //   onChanged: (text){
                          //     time = text;
                          //   },
                          //   // text fiedl hena bta5ud string w7na 3wzen time asasn
                          //   style: TextStyle(fontSize: 22),
                          //   textAlign: TextAlign.center,
                          //   decoration: InputDecoration(
                          //     hintText: '00:00',
                          //     border: InputBorder.none,
                          //   ),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter a time.';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     time = value;
                          //   },
                          //   keyboardType: TextInputType.datetime,
                          // ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 55),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.date,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: myProvider.isDarkMode()?
                              MyTheme.p2.withOpacity(0.8)
                                  :
                              Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Icon(Icons.calendar_today, size: 29),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 29),
              TextFormField(
                onChanged: (text){
                  speciality = text;
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.doctor_is_speciality,
                  fillColor:myProvider.isDarkMode()?
                  MyTheme.p2.withOpacity(0.8)
                      :
                  Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a doctor\'s speciality.';
                  }
                  return null;
                },
                // onSaved: (value) {
                //   speciality = value;
                // },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:myProvider.isDarkMode()?
                  MyTheme.p2.withOpacity(0.8)
                      :
                  Colors.deepPurple,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 60),
                ),

                onPressed: saveFormAppoint,
                child: Text(
                  AppLocalizations.of(context)!.save,
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void saveFormAppoint() {
    if (formKey.currentState?.validate()==true) {
      Appointment appointment = Appointment(dateTime: selectedDate, DoctorName: doctorName,
          Speciality: speciality,time:selectedTime );

      String? user = SharedPref.getId();
      DialogUtills.showLoading(context);
      FireBaseUtills.addAppointmentToFireStore(appointment, user?? "000")
          .then((value) {
            DialogUtills.hideLoading(context);
            // var date = appointment.combinedDateTime;
            // debugPrint('Notification Scheduled for ${appointment.time}');
            // NotificationService().scheduleNotification(
            //   title: 'You have an appointment',
            //   body: 'with ${appointment.DoctorName} at ${appointment.time}',
            //   scheduledNotificationDateTime: date,
            // );
            // print("doooooooooooooooone");
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(
            //     backgroundColor: Colors.purple,
            //     content: Text('The Appointment Added Successfully')));
            // listProvider.getAppointmentsFromFireStore(user?? "00");
            // Navigator.pop(context);
      })
          .timeout(
          Duration(milliseconds: 200),

// sh8len b time out msh b dot then 3shan hena sh8len offline msh online
          onTimeout: () async {
            var date = appointment.combinedDateTime;
            debugPrint('Notification Scheduled for ${appointment.time}');

            NotificationService(appointment: appointment,UserId: user).scheduleNotification(
              // Appointmentid: appointment.id,
              // isDone: appointment.isDone,
              title: 'You have an appointment',
              payload: 'accept',
              body: 'with ${appointment.DoctorName} at ${appointment.time}',
              scheduledNotificationDateTime: date,
            );



            print("doooooooooooooooone");
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                backgroundColor: Colors.purple,
                content: Text('The Appointment Added Successfully')));
            listProvider.getAppointmentsFromFireStore(user?? "00");
            Navigator.pop(context);


          }
      );

    }

    //formKey.currentState!.save();
    // Process the form data
    // e.g., save to a database or send to an API
    //Navigator.of(context).pop();
  }



}
// fe time w selected date msh time bs aw date bs 5libalk