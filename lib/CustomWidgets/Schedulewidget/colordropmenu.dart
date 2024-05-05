import 'package:flutter/material.dart';

const List<String> list = <String>['Red', 'Blue', 'Orange','Yellow','Greeen','White','Violet','Brown'];

class PillDropMenu extends StatefulWidget {
  const PillDropMenu({Key? key}) : super(key: key);

  @override
  State<PillDropMenu> createState() => _PillDropMenuState();
}

class _PillDropMenuState extends State<PillDropMenu> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pill's Color",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 12),
          DropdownButtonHideUnderline(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffEDF2F3),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<String>(
                value: dropdownValue,
                elevation: 16,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}