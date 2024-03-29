

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFF extends StatelessWidget {
  String hint;
  TextEditingController controller ;
  String? Function (String? text) validator;
  CustomTextFF( {required this.hint,required this.controller, required this.validator});


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(30.r),

      child: TextFormField(

        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.r),
              borderSide:
              BorderSide(color: Color(0xffafaaaa), width: 1),

            ),
            focusedBorder:OutlineInputBorder(

              borderRadius: BorderRadius.circular(40.r),
              borderSide:
              BorderSide(color: Color(0xffafaaaa), width: 2),


            )
            ,
            hintText: hint,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w800, color: Colors.grey,
                fontSize: 16)),
        controller: controller,
        validator: validator,



      ),
    );
  }
}
