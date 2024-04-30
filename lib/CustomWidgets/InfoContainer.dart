import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoContainer extends StatelessWidget {
  String infoString;
  String imageIcon;

  InfoContainer({required this.imageIcon , required this.infoString,});


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Image(image: AssetImage(imageIcon), height: 30.h,),

    SizedBox(width: 15.w,),
    Text(infoString, style: TextStyle(color: Color(0xff887E7E),fontSize: 18),)
    ,
          Spacer(),


    ],

    ),
    decoration: BoxDecoration(
    color: Color(0x705d65b0)
    ),
    padding: EdgeInsets.symmetric(vertical:24.h, horizontal: 15.w
    ),
    margin: EdgeInsets.only(top: 18.h, left: 18.w, right: 18.w));
  }
}
