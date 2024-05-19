import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Check extends StatefulWidget {
  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.transparent;
      }
      return Color(0xff5D65B0);
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.medicine_Type,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Radio<String>(
                      value: 'capsule',
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    Text(
                      AppLocalizations.of(context)!.capsule,
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio<String>(
                      value: 'injection',
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    Text(
                      AppLocalizations.of(context)!.injection,
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio<String>(
                      value: 'syrup',
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    Text(
                      AppLocalizations.of(context)!.syrup,
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}