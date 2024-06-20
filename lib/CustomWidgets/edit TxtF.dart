import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../myTheme.dart';
import '../providers/list_provider.dart';

class EditTxtF extends StatelessWidget {
  String title;
  var controller = TextEditingController();
  IconData? iconTitle;
  TextInputType? keyBoard;
  double? width;

  EditTxtF(
      {required this.title,
      required this.controller,
      this.iconTitle,
      this.keyBoard,
      this.width});

  @override
  Widget build(BuildContext context) {
    var listProvider =  Provider.of<ListProvider>(context);
    return Column(
      children: [
        Container(
          //width: 330,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 22,
                      color: listProvider.isDarkMode()?
                          MyTheme.whiteColor
                          :
                      Color(0xff5D65B0),
                      fontWeight: FontWeight.w600),
                ),
              ),
              // Icon(
              //   iconTitle,
              //   color: listProvider.isDarkMode() ?
              //   MyTheme.whiteColor
              //       :
              //   Color(0xff5D65B0),
              // )
            ],
          ),

        ),
        Container(
          decoration: BoxDecoration(
            color:listProvider.isDarkMode()?
            MyTheme.n.withOpacity(0.80)
                :
            Color(0xEDF2F3).withOpacity(0.99),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color:listProvider.isDarkMode()?
                Colors.transparent
                    :
                Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 4), // Shadow position
              ),
            ],
          ),
          //Type TextField
          //width: width ?? 340,
          //height: 42,
          child: TextFormField(
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'please enter text';
              }
              return null;
            },
            controller: controller,
            keyboardType: keyBoard,
            maxLines: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              // pass the hint text parameter here
            ),
            style: TextStyle(
              color: listProvider.isDarkMode()?
              MyTheme.whiteColor
                  :
              Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        )
      ],
    );
  }
}
