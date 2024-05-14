

import 'package:finalproject1/myTheme.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomTextFF extends StatelessWidget {
  String hint;
  TextEditingController controller ;
  String? Function (String? text) validator;
  CustomTextFF( {required this.hint,required this.controller, required this.validator});


  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(30.r),

      child: TextFormField(
          decoration: InputDecoration(
            fillColor: listProvider.isDarkMode()?
              MyTheme.n.withOpacity(0.80)
              :
                MyTheme.whiteColor
              ,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.r),
                borderSide:
                BorderSide(color:listProvider.isDarkMode()?
                MyTheme.n.withOpacity(0.80)
                    :
                Color(0xffafaaaa),width: 1),

              ),
              focusedBorder:OutlineInputBorder(

                borderRadius: BorderRadius.circular(40.r),
                borderSide:
                BorderSide(color:listProvider.isDarkMode()?
                MyTheme.n.withOpacity(0.80)
                    :
                Color(0xffafaaaa), width: 2),


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
