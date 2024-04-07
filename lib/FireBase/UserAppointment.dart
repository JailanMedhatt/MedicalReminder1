class Appointment{
  String? id;
  String? DoctorName;
  String? Speciality;
  DateTime? dateTime;
  bool? isDone;

  Appointment({
    this.id='',
  required this.dateTime,
     this.isDone=false,
    required this.DoctorName,
    required this.Speciality
  });
  Appointment.fromFireStore(Map<String,dynamic>data):this(
    id: data['id'],
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['datetime']),
    DoctorName: data['DoctorName'],
      Speciality: data['Speciality'],
      isDone:data['isDone']
  );




  Map<String,dynamic>toFireSstore(){
    return{
      'id' :id,
      'DoctorName' : DoctorName,
      'Speciality':Speciality,
      'datetime' : dateTime?.millisecondsSinceEpoch,
      'isDone' : isDone
    };

  }

}