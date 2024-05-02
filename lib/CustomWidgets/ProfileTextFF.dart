import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTextFF extends StatelessWidget {

 String iconPath;
 TextEditingController controller;
 String? Function (String? text) validator;
 ProfileTextFF({required this.iconPath, required this.controller,required this.validator});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: TextFormField(


        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0x905d65b0)
            ,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:  Colors.transparent
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:  Colors.transparent
                )
            ), prefixIcon: Image( image:AssetImage(iconPath),height: 10.h,width: 5.w,)

        ),
        controller: controller,
        validator: validator,


      ),
    );
  }
}
