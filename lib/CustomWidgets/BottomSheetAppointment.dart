import 'package:date_field/date_field.dart';
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/FireBase/Models/UserAppointment.dart';
import 'package:finalproject1/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late ListProvider listProvider;

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
     listProvider = Provider.of<ListProvider>(context);
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.8),
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
                'Add Appointment',
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
                  labelText: 'Doctor\'s Name',
                  fillColor: Colors.white,
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
                          'Time',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                          'Date',
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
                              color: Colors.white,
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
                  labelText: 'Doctor\'s Speciality',
                  fillColor: Colors.white,
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
                  backgroundColor: Colors.deepPurple,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 60),
                ),
                onPressed: saveFormAppoint,
                child: Text(
                  'Save',
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


      FireBaseUtillsAppointment.addAppointmentToFireStore(appointment).timeout(
        Duration(milliseconds: 500),
// sh8len b time out msh b dot then 3shan hena sh8len offline msh online
        onTimeout: (){
          print("doooooooooooooooone");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(
                 backgroundColor: Colors.purple,
                content: Text('The Appointment Added Successfully')));
          listProvider.getAppointmentsFromFireStore();
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