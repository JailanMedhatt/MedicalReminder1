

import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/ViewModels/LoginViewModel/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends Cubit<LoginStates> {

  LoginViewModel() :super(InitialLoginState());
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController(text: "jailan@yahoo.com");

  TextEditingController pass = TextEditingController(text: "123456");

  String? emailValidator(String? text) {
    if (text == null || text
        .trim()
        .isEmpty) {
      return "Email required";
    }

    return null;
  }


  String? passValidator(String? text) {
    if (text == null || text
        .trim()
        .isEmpty) {
      return "Password required";
    }
    else if (text.length < 5) {
      return "Weak password";
    }
    return null;
  }

  login() async {
    if (formKey.currentState?.validate()==true) {
      emit(loadingLoginState());
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text,
            password: pass.text
        );
        if(credential.user?.uid!=null){
        await SharedPref.addId(credential.user!.uid!);}
        emit(SuccessLoginState(succesMessage: credential.user?.email??""));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          print(e.code.toString());
          emit(FailedLoginState(errorMessage: "Invalid Credential"));

        }
        print(e.code.toString());
      }
    }
  }

}