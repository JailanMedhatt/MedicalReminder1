import 'package:flutter/material.dart';

const List<String> list = <String>['Everyday', 'Twice a day', 'Third a day'];

class DropdownMenuBottom extends StatefulWidget {
  const DropdownMenuBottom({Key? key}) : super(key: key);

  @override
  State<DropdownMenuBottom> createState() => _DropdownMenuBottomState();
}

class _DropdownMenuBottomState extends State<DropdownMenuBottom> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'How Often is this dose taken?',
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