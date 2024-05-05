import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class List extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20, top: 8,bottom: 8 ,left: 20),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
    color: Colors.grey[350],
    ),
    child: Row(
    children: [
    Column(
    children: [
    Row(
    children: [
    Padding(
    padding:  EdgeInsets.all(16.0),
    child:FaIcon(FontAwesomeIcons.pills,
    size:30,
    color: Color(0xff5D65B0),

    ),
    ),


    ],
    ),
    SizedBox(width:12.0,
    ),
    Text('8:00 am',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),

    Padding(
    padding:  EdgeInsets.only(left: 7.0,top: 7,bottom: 7,right: 7),
    child: Text(
    "",
    style: TextStyle(color: Colors.deepPurple),
    ),
    ),
    ],
    ),
    SizedBox(width: 40,),

    Expanded(
    child: Row(
    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(height: 8.0,
    // width: 50.0,
    )
    ,
    Text(
    "Theraflu MaxGrip",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Text("2 pills(15mg)",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    ],
    ),
    Spacer(),
    Padding(
    padding: const EdgeInsets.only(right: 5.0),
      child: Row(
        children: [
          Radio<bool?>(
            value: true,
            groupValue: null,
            activeColor:Color(0xff5D65B0) ,
            onChanged: (bool? value) {
              // Handle radio button selection
            },
          ),
          Text(
            "Taken",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:  Color(0xff5D65B0)),
          ),
        ],
      ),

      // child: CircleButtonWithText(),
    ),
    ],
    ),

    ),
    ],
    ));

  }
}