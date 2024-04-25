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
  int _oneValue = -1;
  List medTYPE = [
    {
      'label': 'Syrup',
      'IMG': 'assets/images/Syrup.png',
      'value': 1,
    },
    {'label': 'Pills', 'IMG': 'assets/images/Pills.png', 'value': 2},
    {'label': 'Syringe', 'IMG': 'assets/images/Syringe.png', 'value': 3}
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          for (var item in medTYPE)
            Expanded(
              child: Row(children: [
                Radio(
                    activeColor: Color(0xff5D65B0),
                    value: item['value'],
                    groupValue: _oneValue,
                    onChanged: (value) {
                      setState(() {
                        _oneValue = value!;
                        print(_oneValue);
                      });
                    }),
                Text(
                  item['label'],
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff5D65B0),
                      fontWeight: FontWeight.w600),
                ),
                Image.asset(
                  item['IMG'],
                  width: 38,
                  height: 33,
                )

                // Radio(
                //     activeColor:  Color(0xff5D65B0),
                //     value:item['value'],
                //     groupValue: _oneValue,
                //     onChanged: (value) {
                //       setState(() {
                //         _oneValue = value!;
                //         print(_oneValue);
                //       });
                //     }),
              ]),
            )
        ],
      ),
    );
  }
}
