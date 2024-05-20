

import 'package:finalproject1/providers/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../myTheme.dart';

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
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.dose_taken,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 12),
          DropdownButtonHideUnderline(
            child: Container(
              decoration: BoxDecoration(
                color: listProvider.isDarkMode()?
                MyTheme.n.withOpacity(0.8)
                    :
                Color(0xffEDF2F3),
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