import 'package:finalproject1/FireBase/Models/Medicine.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../UI/Edit Medicine.dart';
import '../../myTheme.dart';
import '../../providers/list_provider.dart';

class CustomList extends StatefulWidget {
  Medicine medicine;

  CustomList({required this.medicine});

  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  bool? radioValue = false;
//  _CustomListStateList({required this.medicine});

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(EditMedicine.routeName, arguments: widget.medicine);
      },
      child: Container(
        margin: EdgeInsets.only(right: 20, top: 8, bottom: 8, left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: listProvider.isDarkMode()?
              MyTheme.p.withOpacity(0.80)
              :
          Colors.grey[350],
        ),
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FaIcon(
                        FontAwesomeIcons.pills,
                        size: 30,
                        color:listProvider.isDarkMode()?
                            MyTheme.icondark
                        :
                        Color(0xff5D65B0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  "${widget.medicine?.time?.hour.toString().padLeft(2, '0')}:${widget.medicine.time?.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: listProvider.isDarkMode()?
                    MyTheme.whiteColor
                        :
                    Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 7.0,
                    top: 7,
                    bottom: 7,
                    right: 7,
                  ),
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.medicine.MedicineName ?? 'oo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.medicine.NoOfPills.toString()} Pills',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Row(
                      children: [
                        Radio<bool?>(
                          value: true,
                          groupValue: radioValue,
                          activeColor: listProvider.isDarkMode()?
                          MyTheme.icondark
                              :
                          Color(0xff5D65B0),
                          onChanged: (bool? value) {
                            setState(() {
                              radioValue = value;
                            });
                          },
                        ),
                        Text(
                          AppLocalizations.of(context)!.taken,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: listProvider.isDarkMode()?
                            MyTheme.icondark
                                :
                            Color(0xff5D65B0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}