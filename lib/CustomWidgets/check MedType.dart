import 'package:flutter/material.dart';

class CheckMedType extends StatefulWidget {
  String type;
  String IMG;
  bool? iconIsPressed;

  CheckMedType({required this.type, required this.IMG, this.iconIsPressed});

  @override
  State<CheckMedType> createState() => _CheckMedTypeState();
}

class _CheckMedTypeState extends State<CheckMedType> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(
          // Icons.check_circle,
          // size: 24.0,color:Color(0xff5D65B0) ,
          // ),
          IconButton(
            icon: Icon(
              widget.iconIsPressed == true
                  ? Icons.check_circle
                  : Icons.circle_outlined,
              size: 24.0,
              color: Color(0xff5D65B0),
            ),
            tooltip: 'Choose Medicine Type',
            onPressed: () {
              setState(() {
                widget.iconIsPressed = true;
              });
            },
          ),
          Text(
            widget.type,
            style: TextStyle(
                fontSize: 22,
                color: Color(0xff5D65B0),
                fontWeight: FontWeight.w600),
          ),
          Image.asset(
            widget.IMG,
            width: 38,
            height: 37,
          )
        ],
      ),
    );
  }
}
