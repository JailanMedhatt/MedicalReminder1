import 'package:flutter/material.dart';

class EditTxtF extends StatelessWidget {
  String title;
  String hintTxt;
  IconData? iconTitle;
  TextInputType? keyBoard;
  double? width;

  EditTxtF(
      {required this.title,
      required this.hintTxt,
      this.iconTitle,
      this.keyBoard,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 330,
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff5D65B0),
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                iconTitle,
                color: Color(0xff5D65B0),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xEDF2F3).withOpacity(0.99),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 4), // Shadow position
              ),
            ],
          ),
          //Type TextField
          width: width ?? 340,
          height: 50,
          child: TextField(
            controller: TextEditingController(),
            keyboardType: keyBoard,
            maxLines: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: hintTxt, // pass the hint text parameter here
              hintStyle: TextStyle(
                  color: Color(0x887E7E).withOpacity(0.99), fontSize: 21),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 19,
        )
      ],
    );
  }
}
