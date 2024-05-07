import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine{
  String? id;
  String? MedicineName;
  String? Description;
  String? MedicineType;
  String? PillColor;
  int? NoOfPills;
  DateTime? EndDate;
  DateTime? StartDate;
  bool? isDone;
  DateTime? time;

 Medicine({
    this.id='',
   required this.StartDate,
   required this.EndDate,
    this.isDone=false,
    this.MedicineType='',
   this.PillColor='',
    required this.NoOfPills ,
    required this.MedicineName,
    required this.Description,
  required this.time,
  });
  Medicine.fromFireStore(Map<String, dynamic> data)
      : this(
    id: data['id'],
    StartDate: data['StartDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(data['StartDate'])
        : null,
    EndDate: data['EndDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(data['EndDate'])
        : null,
    MedicineName: data['MedicineName'],
    MedicineType: data['MedicineType'],
    PillColor: data['PillColor'],
    NoOfPills: data['NoOfPills'],
    Description: data['Description'],
    isDone: data['isDone'],
    time: data['time'] != null
        ? data['time'] is int
        ? DateTime.fromMillisecondsSinceEpoch(data['time'])
        : (data['time'] as Timestamp).toDate()
        : null,
  );




  Map<String, dynamic> toFireSstore() {
    return {
      'id': id,
      'MedicineType': MedicineType,
      'PillColor': PillColor,
      'MedicineName': MedicineName,
      'NoOfPills': NoOfPills ,
      'Description': Description,
      'StartDate': StartDate != null ? StartDate!.millisecondsSinceEpoch : null,
      'EndDate': EndDate != null ? EndDate!.millisecondsSinceEpoch : null,
      'isDone': isDone,
      'time': time != null ? time!.millisecondsSinceEpoch : null,
    };
  }

}