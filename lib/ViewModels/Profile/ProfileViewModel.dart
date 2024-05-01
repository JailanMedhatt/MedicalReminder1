

import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/FireBase/Models/MyUser.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/UI/profile/PhoneModalSheet.dart';
import 'package:finalproject1/ViewModels/Profile/ProfileStates.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewModel extends Cubit<ProfileStates>{
  ProfileViewModel._():super(InitialProfileState());
  static ProfileViewModel? _instance;
  MyUser? user;
  final formKey = GlobalKey<FormState>();
  TextEditingController numE= TextEditingController();
  TextEditingController nameE= TextEditingController();
  TextEditingController partnerE= TextEditingController();
  static ProfileViewModel getPorfileViewModel(){
    _instance??= ProfileViewModel._();
    return _instance!;
  }
  String? PartneremailValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "Email required";
    }
    bool isValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if (!isValid) {
      return "Wrong Email Format";
    }
    return null;
  }

  String? nameValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "Name required";
    }
  }
  String? phoneNumValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "PhoneNumber required";
    } else if (text.length != 11) {
      return "accepts only Egyptians number";
    }
  }
 void LoadProfile()async{
   emit(LoadingProfileState());
   String? id =await SharedPref.getId();
   user = await FireBaseUtills.getUserFromFireStore(id??"");
   if(user!=null){
     numE.text=user?.phoneNumber??"";
     nameE.text=user?.name??"";
     partnerE.text=user?.partnerEmail??"";
     emit(LoadedProfileState(user: user!));

   }



 }
  void EditDetails(){
    if(formKey.currentState?.validate()==true){
      FireBaseUtills.editUserDetails(partnerE: partnerE.text, phone: numE.text, name: nameE.text);
      LoadProfile();


    }
  }

  // showLanguageModalsheet(BuildContext context) {
  //   showModalBottomSheet(context: context, builder:(context)=>PhoneModalSheet());
  //   emit(LoadModalState());
  //
  // }
}