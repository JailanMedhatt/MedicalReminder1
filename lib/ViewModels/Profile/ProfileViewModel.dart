
import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/FireBase/Models/MyUser.dart';
import 'package:finalproject1/Security.dart';
import 'package:finalproject1/SharedPref.dart';

import 'package:finalproject1/ViewModels/Profile/ProfileStates.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewModel extends Cubit<ProfileStates> {
  ProfileViewModel._() : super(InitialProfileState());
  static ProfileViewModel? _instance;
  MyUser? user;
  MyUser? decUser;
  final formKey = GlobalKey<FormState>();
  TextEditingController numE = TextEditingController();
  TextEditingController nameE = TextEditingController();
  TextEditingController partnerE = TextEditingController();
  static ProfileViewModel getPorfileViewModel() {
    _instance ??= ProfileViewModel._();
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

  void LoadProfile() async {
    try {


      emit(LoadingProfileState());
      String? id = await SharedPref.getId();
      user = await FireBaseUtills.getUserFromFireStore(id ?? "");

      if (user != null) {
        print("n");
        String decname = Security.decryptData(user?.name ?? "");
        String decEmail = Security.decryptData(user?.email ?? "");
        String decPartnerE = Security.decryptData(user?.partnerEmail ?? "");
        String decPhone = Security.decryptData(user?.phoneNumber ?? "");

        decUser = MyUser(
            name: decname,
            id: id,
            email: decEmail,
            partnerEmail: decPartnerE,
            phoneNumber: decPhone);

        numE.text = decUser?.phoneNumber ?? "";
        nameE.text = decUser?.name ?? "";
        partnerE.text = decUser?.partnerEmail ?? "";
        emit(LoadedProfileState(user: decUser!));
      }
    } catch (e) {
      print(e.toString() + "hereee");
    }
  }

  void EditDetails() {
    if (formKey.currentState?.validate() == true) {
      String nameEnc = Security.encryptData(nameE.text);
      String phoneEnc = Security.encryptData(numE.text);
      String partnerEmailEnc = Security.encryptData(partnerE.text);

      FireBaseUtills.editUserDetails(
          partnerE: partnerEmailEnc, phone:phoneEnc , name: nameEnc);
      LoadProfile();
    }
  }


}
