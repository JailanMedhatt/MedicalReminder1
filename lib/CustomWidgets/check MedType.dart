import 'package:finalproject1/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../FireBase/Models/Medicine.dart';
import '../providers/ReminderProvider.dart';
import '../providers/list_provider.dart';

class CheckMedType extends StatefulWidget {
  @override
  State<CheckMedType> createState() => _CheckMedTypeState();
}

class _CheckMedTypeState extends State<CheckMedType> {
  late ReminderListProvider listProvider;
  Medicine? medicine;

  int _oneValue = 2; // Set to -1 initially, indicating no default value
  List medTYPE = [
    {
      'label': 'Syrup',
      'IMG': 'assets/images/Syrup.png',
      'value': 1,
    },
    {'label': 'Capsule', 'IMG': 'assets/images/Pills.png', 'value': 2},
    {'label': 'Injection', 'IMG': 'assets/images/Syringe.png', 'value': 3}
  ];

  @override
  void initState() {
    super.initState();
    // Fetch the medicine instance from ModalRoute
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        medicine = ModalRoute.of(context)?.settings.arguments as Medicine?;
        if (medicine != null) {
          // Find the default value corresponding to MedicineType
          var defaultValue = medTYPE.firstWhere(
            (item) => item['label'] == medicine!.MedicineType,
            orElse: () => null,
          );
          if (defaultValue != null) {
            _oneValue = defaultValue['value']; // Set the default value
          } else {
            print('Default value not found for ${medicine!.MedicineType}');
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ListProvider>(context);
    listProvider = Provider.of<ReminderListProvider>(context);
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: <Widget>[
          for (var item in medTYPE)
            Expanded(
              child: Row(
                children: [
                  Radio(
                    activeColor: myProvider.isDarkMode()?
                        MyTheme.icondark
                        :
                    Color(0xff5D65B0),
                    value: item['value'],
                    groupValue: _oneValue,
                    onChanged: (value) {
                      setState(() {
                        _oneValue = value;
                        print(_oneValue);
                      });
                    },
                  ),
                  Text(
                    item['label'],
                    style: TextStyle(
                      fontSize: 22,
                      color:  myProvider.isDarkMode()?
                      MyTheme.whiteColor
                          :
                      Color(0xff5D65B0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image.asset(
                    item['IMG'],
                    width: 38,
                    height: 28,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
