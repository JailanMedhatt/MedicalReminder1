import 'package:finalproject1/CustomWidgets/CustomTextFF.dart';
import 'package:finalproject1/DialogUtills.dart';
import 'package:finalproject1/UI/Login.dart';
import 'package:finalproject1/ViewModels/Register/RegisterState.dart';
import 'package:finalproject1/ViewModels/Register/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatelessWidget {
  static const String routeName = "register";

  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if(state is loadingRegisterState){
          DialogUtills.showLoading(context);

        }
        if(state is FailedRegisterState){
          DialogUtills.hideLoading(context);
          DialogUtills.showMessage(state.errorMessage, context, actionName: "ok");

        }
        if(state is SuccessRegisterState){
          DialogUtills.hideLoading(context);
          DialogUtills.showMessage(state.succesMessage, context, actionName: "ok");

        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Opening.png", ),
                    fit: BoxFit.cover,
                )),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 116.h, bottom: 20.h),
                    child: Image.asset("assets/images/logoTry.png")),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        CustomTextFF(
                          hint: "  Enter Your Full Name",
                          controller: viewModel.name,
                          validator: viewModel.nameValidator,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: CustomTextFF(
                            hint: "  Enter your Email",
                            controller: viewModel.email,
                            validator: viewModel.emailValidator,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: CustomTextFF(
                            hint: "  Enter your Password",
                            controller: viewModel.pass,
                            validator: viewModel.passValidator,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: CustomTextFF(
                            hint: "  Confirm Password",
                            controller: viewModel.conPass,
                            validator: viewModel.conPassValidator,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: CustomTextFF(
                            hint: "  Partner Email",
                            controller: viewModel.partnerEmail,
                            validator: viewModel.PartneremailValidator,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.register();
                              },
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff5D65B0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 70.w, vertical: 5.h),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.r))),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30.h, left: 45.w, bottom: 70.h),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginPage.routeName);
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Alraedy have an account ?",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text("  Sign In",
                                    style: TextStyle(
                                        color: Color(0xff5D65B0), fontSize: 17))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
