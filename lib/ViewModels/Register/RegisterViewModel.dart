import 'package:finalproject1/FireBase/FirebaseUtills.dart';
import 'package:finalproject1/FireBase/Models/MyUser.dart';
import 'package:finalproject1/ViewModels/Register/RegisterState.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterViewModel() : super(InitialRegisterState());
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController(text: "jailan@yahoo.com");
  TextEditingController name = TextEditingController(text: "jailan");
  TextEditingController pass = TextEditingController(text: "123456");
  TextEditingController conPass = TextEditingController(text: "123456");
  TextEditingController partnerEmail =
      TextEditingController(text: "nona@route.com");
  TextEditingController phoneNum = TextEditingController(text: "01024064673");
  String? emailValidator(String? text) {
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



  String? passValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "Password required";
    } else if (text.length < 5) {
      return "Weak password";
    }
    return null;
  }

  String? conPassValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "Confirmation Password required";
    } else if (text != pass.text) {
      return "Password doesn't match";
    }
  }

  String? phoneNumValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "PhoneNumber required";
    } else if (text.length != 11) {
      return "accepts only Egyptians number";
    }
  }

  register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(loadingRegisterState());
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: pass.text,
        );
        MyUser user = MyUser(
            name: name.text,
            id: credential.user?.uid ?? "",
            email: email.text,
            partnerEmail: partnerEmail.text,
            phoneNumber: phoneNum.text);
           await FireBaseUtills.addUsertoFireStore(user);

        emit(SuccessRegisterState(succesMessage: "${credential.user?.uid}"));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          emit(FailedRegisterState(
              errorMessage: "The password provided is too weak"));
        } else if (e.code == 'email-already-in-use') {
          emit(FailedRegisterState(errorMessage: "Email already in use"));
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
        emit(FailedRegisterState(errorMessage: e.toString()));
      }
    }
  }
}
