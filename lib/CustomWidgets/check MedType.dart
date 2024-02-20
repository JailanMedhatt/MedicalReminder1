import 'package:flutter/material.dart';

class CheckMedType extends StatelessWidget {
  String type;
  String IMG;

  CheckMedType({required this.type, required this.IMG});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon(
        // Icons.check_circle,
        // size: 24.0,color:Color(0xff5D65B0) ,
        // ),
        Icon(
          Icons.circle_outlined,
          size: 24.0,
          color: Color(0xff5D65B0),
        ),
        Text(
          type,
          style: TextStyle(
              fontSize: 22,
              color: Color(0xff5D65B0),
              fontWeight: FontWeight.w600),
        ),
        Image.asset(
          IMG,
          width: 38,
          height: 37,
        )
      ],
    );
  }
}
