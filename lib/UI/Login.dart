import 'package:finalproject1/CustomWidgets/CustomTextFF.dart';
import 'package:finalproject1/UI/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "login";
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Opening.png"),
                fit: BoxFit.fitWidth)),
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
                    CustomTextFF(hint: "  Enter Your Name"),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: CustomTextFF(
                        hint: "  Enter your password",
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 60.h),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "HomeScreen");
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff5D65B0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70.w, vertical: 5.h), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),

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
    );
  }
}
