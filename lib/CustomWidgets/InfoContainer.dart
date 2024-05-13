import 'package:finalproject1/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

class InfoContainer extends StatelessWidget {
  String infoString;
  String imageIcon;

  InfoContainer({required this.imageIcon , required this.infoString,});


  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Image(image: AssetImage(imageIcon), height: 30.h,
          color: listProvider.isDarkMode()?
          MyTheme.icondark
          :
          MyTheme.iconlight,
        ),

    SizedBox(width: 15.w,),
    Text(infoString, //style: TextStyle(color: Color(0xff887E7E),fontSize: 18),
     style: listProvider.isDarkMode()?
      Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.whiteColor,fontSize: 18)
    :
     Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.greyColor , fontSize: 18 ))
    ,
          Spacer(),


    ],

    ),
    decoration: BoxDecoration(
    //color: Color(0x705d65b0)
      color: listProvider.isDarkMode()?
          MyTheme.p2.withOpacity(0.80)
          :
          MyTheme.r
    ),
    padding: EdgeInsets.symmetric(vertical:24.h, horizontal: 15.w
    ),
    margin: EdgeInsets.only(top: 18.h, left: 18.w, right: 18.w));
  }
}
