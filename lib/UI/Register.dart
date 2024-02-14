import 'package:finalproject1/CustomWidgets/CustomTextFF.dart';
import 'package:finalproject1/UI/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatelessWidget {
  static const String routeName = "register";
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Opening.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: Image.asset("assets/images/logoo.png")),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      CustomTextFF(hint: "  Enter Your Full Name"),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: CustomTextFF(
                          hint: "  Enter your Email",
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: CustomTextFF(
                          hint: "  Enter your Password",
                        ),


                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: CustomTextFF(
                          hint: "  Confirm Password",
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: CustomTextFF(
                          hint: "  Partner Email",
                        ),

                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "SignUp",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff5D65B0),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70.w, vertical: 5.h), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),

                          )),
                      Padding(padding: EdgeInsets.only(top: 30.h, left: 45.w, bottom: 70.h)
                      ,child: InkWell(
                          onTap: (){Navigator.pushReplacementNamed(context, LoginPage.routeName);},
                          child: Row(children: [
                            Text("Alraedy have an account ?", style: TextStyle(fontSize: 17),),
                            Text("  Sign In", style: TextStyle(color:Color(0xff5D65B0), fontSize: 17))
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
