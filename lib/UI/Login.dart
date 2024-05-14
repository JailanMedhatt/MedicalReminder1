import 'package:finalproject1/CustomWidgets/CustomTextFF.dart';
import 'package:finalproject1/DialogUtills.dart';
import 'package:finalproject1/UI/Register.dart';
import 'package:finalproject1/ViewModels/LoginViewModel/LoginState.dart';
import 'package:finalproject1/ViewModels/LoginViewModel/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "login";
  final formkey = GlobalKey<FormState>();
  LoginViewModel viewModel =LoginViewModel();

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return BlocListener<LoginViewModel,LoginStates>(
      bloc: viewModel,
      listener: (context, state){
        if(state is loadingLoginState){
          DialogUtills.showLoading(context);

        }
        if(state is FailedLoginState){
          DialogUtills.hideLoading(context);
          DialogUtills.showMessage(state.errorMessage, context, posActionName: "ok",mytitle: "Error");

        }
        if(state is SuccessLoginState){
          DialogUtills.hideLoading(context);
          DialogUtills.showMessage(state.succesMessage, context, posActionName: "ok",mytitle: "WELCOME💜",
              posAction:(){ Navigator.pushReplacementNamed(context, "SlideMenu");});

        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image:listProvider.getBackgroundImage()
          ,),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: Image.asset("assets/images/logoo.png")),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      CustomTextFF(hint: "  Enter Your Email",
                      controller: viewModel.email,validator: viewModel.emailValidator,),

                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: CustomTextFF(
                          hint: "  Enter your password",
                          controller: viewModel.pass,validator:  viewModel.emailValidator,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 60.h),
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.login();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                                shadowColor: Color(0xff5D65B0),
                                elevation: 25,
                                backgroundColor: Color(0xff5D65B0),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70.w, vertical: 5.h),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),

                          )),
                      Padding(padding: EdgeInsets.only(top: 35.h, left: 45.w)
                      ,child: InkWell(
                          onTap: (){

                            Navigator.pushReplacementNamed(context, Register.routeName);
                          },
                          child: Row(children: [
                            Text("Don’t have an account ?", style: TextStyle(fontSize: 17),),
                            Text("  Sign Up", style: TextStyle(color:Color(0xff5D65B0), fontSize: 17))
                          ],),
                        ),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
