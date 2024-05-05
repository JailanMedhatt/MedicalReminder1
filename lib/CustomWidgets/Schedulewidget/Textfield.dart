import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchadualePgae extends StatelessWidget{
   String hint;
   String text;
   SchadualePgae({required this.hint, required this.text});
  @override
  Widget build(BuildContext context){
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(text, style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 11, vertical:2),
            child: Material(
              color: Colors.transparent,
              elevation: 18,
              child: SizedBox(
                height: 45.0,
                child: TextField(

                  decoration: InputDecoration(
                    fillColor:Color(0xffEDF2F3),
                    filled: true,
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(width: 1,color: Color(0xffEDF2F3)),
                    ),

                    hintText: hint,
                  ),
                ),
              ),
            ),
          ),




        ],
      );

  }
}