import 'package:finalproject1/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/list_provider.dart';

class ColorItem {
  final Color color;
  final String name;

  ColorItem(this.color, this.name);
}

 List<ColorItem> colorList = [
  ColorItem(Colors.red, "Red"),
  ColorItem(Colors.blue, "Blue"),
  ColorItem(Colors.orange, "Orange"),
  ColorItem(Colors.yellow, "Yellow"),
  ColorItem(Colors.green, "Green"),
  ColorItem(Colors.white, "White"),
  ColorItem(Colors.purple, "Purple"),
  ColorItem(Colors.brown, "Brown"),
];

class PillDropMenu extends StatefulWidget {
  const PillDropMenu({Key? key}) : super(key: key);

  @override
  State<PillDropMenu> createState() => _PillDropMenuState();
}

class _PillDropMenuState extends State<PillDropMenu> {
  ColorItem selectedColor = colorList.first;

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.pill_Color,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 12),
          DropdownButtonHideUnderline(
            child: Container(
              decoration: BoxDecoration(
                color: listProvider.isDarkMode()?
                    MyTheme.n.withOpacity(0.80)
                    :
                Color(0xffEDF2F3),
                borderRadius: BorderRadius.circular(12),
              ),
              // width: MediaQuery.of(context).size.width - 24.0,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<ColorItem>(
                value: selectedColor,
                elevation: 16,
                onChanged: (ColorItem? newValue) {
                  setState(() {
                    selectedColor = newValue!;
                  });
                },
                items: colorList.map<DropdownMenuItem<ColorItem>>((ColorItem value) {
                  return DropdownMenuItem<ColorItem>(
                    value: value,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 200), // Set the maximum width here
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: value.color,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              value.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
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