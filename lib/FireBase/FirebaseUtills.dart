import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject1/FireBase/Models/MyUser.dart';

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
