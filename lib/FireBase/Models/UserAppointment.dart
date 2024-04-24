import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';

class Appointment{
  String? id;
  String? DoctorName;
  String? Speciality;
  DateTime? dateTime;
  bool? isDone;
  DateTime? time;

  Appointment({
    this.id='',
  required this.dateTime,
     this.isDone=false,
    required this.DoctorName,
    required this.Speciality,
     required this.time
  });
  Appointment.fromFireStore(Map<String,dynamic>data):this(
    id: data['id'],
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['datetime']),
    DoctorName: data['DoctorName'],
      Speciality: data['Speciality'],
      isDone:data['isDone'],
    time: data['time'] != null
        ? data['time'] is int
        ? DateTime.fromMillisecondsSinceEpoch(data['time'])
        : (data['time'] as Timestamp).toDate()
        : null,
  );




  Map<String,dynamic>toFireSstore(){
    return{
      'id' :id,
      'DoctorName' : DoctorName,
      'Speciality':Speciality,
      'datetime' : dateTime?.millisecondsSinceEpoch,
      'isDone' : isDone,
      'time' : time?.millisecondsSinceEpoch
    };

  }

}