import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject1/FireBase/Models/MyUser.dart';
import 'package:finalproject1/FireBase/Models/UserAppointment.dart';

class FireBaseUtills {
  static CollectionReference<MyUser> getUserCollectionRef() {
    return FirebaseFirestore.instance.collection("users").withConverter<MyUser>(
        fromFirestore: (snapchot, option) =>
            MyUser.fromFireStore(snapchot.data()!),
        toFirestore: (user, option) => user.toFireStore());
  }
  static Future<void> addUsertoFireStore(MyUser user){
    return getUserCollectionRef().doc(user.id).set(user);
  }
  static Future<MyUser?> getUserFromFireStore(String id) async{
    var docSnapchot= await getUserCollectionRef().doc(id).get();
    return docSnapchot.data();
  }
}
///Appointment
class FireBaseUtillsAppointment{
  static CollectionReference<Appointment> getAppointmentCollection(
      ){
   return FirebaseFirestore.instance.collection('Appointment').withConverter<Appointment>(

        fromFirestore: (snapshot,option)=>  Appointment.fromFireStore(snapshot.data()!),
        toFirestore: (Appointment,option)=>Appointment.toFireSstore()
    );
  }
  static Future<void> addAppointmentToFireStore(Appointment appointment){
    var taskCollection = getAppointmentCollection();
    DocumentReference<Appointment> docRef = taskCollection.doc();
    appointment.id=docRef.id;
    return docRef.set(appointment);
  }

  static Future<void> deleteAppointment(Appointment appointment){
    return getAppointmentCollection().doc(appointment.id).delete();
  }

}