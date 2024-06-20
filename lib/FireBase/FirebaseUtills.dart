import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject1/FireBase/Models/MyUser.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'Models/Medicine.dart';
import 'Models/UserAppointment.dart';
// 7tet Id fe add w dekete appointment
class FireBaseUtills {
  static String? id =SharedPref.getId();
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
  static  editUserDetails({required String partnerE,required String phone, required String name}){
    getUserCollectionRef().doc(id).update({"phoneNumber":phone,"partnerEmail":partnerE,"name":name});
  }

  /// aapointmennnnnnnnnnnt bs gwa class el utills el fe user kolo fe b3du
  static CollectionReference<Appointment> getAppointmentCollection(String Id) {
    return getUserCollectionRef().doc(Id)
        .collection('Appointment')
        .withConverter<Appointment>(
        fromFirestore: (snapshot, option) =>
            Appointment.fromFireStore(snapshot.data()!),
        toFirestore: (Appointment, option) => Appointment.toFireSstore());
  }

  static Future<void> addAppointmentToFireStore(Appointment appointment,String Id) {
    var taskCollection = getAppointmentCollection(Id);
    DocumentReference<Appointment> docRef = taskCollection.doc();
    appointment.id = docRef.id;
    return docRef.set(appointment);
  }


  static Future<void> deleteAppointment(Appointment appointment,String Id){
    return getAppointmentCollection(Id).doc(appointment.id).delete();

  }

  //////////////////////////////////
  ///dh shu8l medicine farah
  static CollectionReference<Medicine> getMedicineCollection(String uId) {
    return getUserCollectionRef().doc(uId)
        .collection('Medicine')
        .withConverter<Medicine>(
        fromFirestore: (snapshot, option) =>
            Medicine.fromFireStore(snapshot.data()!),
        toFirestore: (Medicine, option) => Medicine.toFireSstore());
  }

  static Future<void> addmedicineToFireStore(Medicine medicine,String uId) {
    var medicineCollection = getMedicineCollection(uId);
    DocumentReference<Medicine> docRef = medicineCollection.doc();
    medicine.id = docRef.id;
    return docRef.set(medicine);
  }

  static editMedicineReminder(Medicine medicine,String uId) {
    return getMedicineCollection(uId)
        .doc(medicine.id)
        .update(medicine.toFireSstore());
  }

  static Future<void> deleteMedicine(Medicine medicine,String uId){
    return getMedicineCollection(uId).doc(medicine.id).delete();

  }
  ///l7d hna

  static editUAppointmentDetails(bool isDone, String Id, String Appointmentid) {
    getAppointmentCollection(Id).doc(Appointmentid).update({"isDone": isDone});
  }
  // static  editAppointmentDetails(Appointment appointment, String Id){
  //   getUserCollectionRef().doc(id).update();
  // }


}
///Appointment
// class FireBaseUtillsAppointment {
//   static CollectionReference<Appointment> getAppointmentCollection() {
//
//     return FirebaseFirestore.instance
//         .collection('Appointment')
//         .withConverter<Appointment>(
//             fromFirestore: (snapshot, option) =>
//                 Appointment.fromFireStore(snapshot.data()!),
//             toFirestore: (Appointment, option) => Appointment.toFireSstore());
//   }
//
//   static Future<void> addAppointmentToFireStore(Appointment appointment) {
//     var taskCollection = getAppointmentCollection();
//     DocumentReference<Appointment> docRef = taskCollection.doc();
//     appointment.id = docRef.id;
//     return docRef.set(appointment);
//   }
//
//
//   static Future<void> deleteAppointment(Appointment appointment){
//     return getAppointmentCollection().doc(appointment.id).delete();
//
//   }
// }

class UploadPdfs {
  static Future<String> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await reference.getDownloadURL();
    return downloadLink;
  }

}
//
//
//
