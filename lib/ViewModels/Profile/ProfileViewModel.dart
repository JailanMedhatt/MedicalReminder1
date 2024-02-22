import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/FireBase/Models/MyUser.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileStates.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewModel extends Cubit<ProfileStates>{
  ProfileViewModel():super(InitialProfileState());
  MyUser? user;
 void LoadProfile()async{
   emit(LoadingProfileState());
   String? id =await SharedPref.getId();
   user = await FireBaseUtills.getUserFromFireStore(id??"");
   if(user!=null){
     emit(LoadedProfileState(user: user!));
   }
 }
}