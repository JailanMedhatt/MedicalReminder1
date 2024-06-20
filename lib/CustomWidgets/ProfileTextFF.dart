import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../myTheme.dart';
import '../providers/list_provider.dart';

class ProfileTextFF extends StatelessWidget {

 String iconPath;
 TextEditingController controller;
 String? Function (String? text) validator;
 ProfileTextFF({required this.iconPath, required this.controller,required this.validator});
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ListProvider>(context);

    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            // color:  listProvider.isDarkMode() ?
            // Color(0xff3d425d):
            //Colors.white,
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 5.0), // changes position of shadow
            ),],),
        child: TextFormField(


          decoration: InputDecoration(

              filled: true,
              fillColor:  myProvider.isDarkMode()?
              Color(0xff3d425d)
                  :
              Colors.white,
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
      ),
    );
  }
}
