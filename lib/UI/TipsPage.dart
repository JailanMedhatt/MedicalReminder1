import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/tipsBG.png"),fit: BoxFit.cover)
          ),

        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Health Tips", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
          ),
          body:
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(color:Colors.grey.withOpacity(0.3),borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Ultra-processed foods (UPFs) are foods containing ingredients that are significantly modified from their original form. They often contain additives like added sugar, highly refined oil, salt, preservatives, artificial sweeteners, colors, and flavors as well ",
                      style:TextStyle(fontSize: 19,fontWeight: FontWeight.w400) ),
                ),
              ),
            )
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: AssetImage("assets/images/bk.png"),fit: BoxFit.cover)
          //   ),
          //   child:
          //   Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(40.0),
          //         child: Row(
          //           children: [
          //             Text("Health Tips",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ),
      ],
    );
  }

}