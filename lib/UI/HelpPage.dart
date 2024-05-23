import 'package:finalproject1/UI/firstHelpScreen.dart';
import 'package:finalproject1/UI/secondHelpScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../myTheme.dart';
import '../providers/list_provider.dart';

class HelpScreen extends StatelessWidget {
  static const String routeName = 'help_screen';

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Stack(children: [
      Container(
          decoration:  BoxDecoration(
            image: listProvider.getBackgroundImage(),
          )),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
              title: Text(
                AppLocalizations.of(context)!.help_Support,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, FirstScreenHelpAndSupport.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: listProvider.isDarkMode()?
                    MyTheme.n.withOpacity(0.80)
                    :
                    Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: listProvider.isDarkMode()?
                    MyTheme.n.withOpacity(0.80)
                        :
                    Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.fAQS, style:
                    TextStyle(color: listProvider.isDarkMode()?
                          MyTheme.whiteColor
                    :
                    Colors.grey, fontSize: 19)),
                       Icon(Icons.arrow_forward, color: listProvider.isDarkMode()?
                       MyTheme.whiteColor
                           :
                       Colors.grey),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SecondScreenHelpAndSupport.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(right: 16,left: 16),

                  decoration: BoxDecoration(
                    color:listProvider.isDarkMode()?
                    MyTheme.n.withOpacity(0.80)
                        :
                    Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: listProvider.isDarkMode()?
                    MyTheme.n.withOpacity(0.80)
                        :
                    Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.contact, style: TextStyle(color: listProvider.isDarkMode()?
                      MyTheme.whiteColor
                          :
                      Colors.grey, fontSize: 19)),
                      Icon(Icons.arrow_forward, color: listProvider.isDarkMode()?
                      MyTheme.whiteColor
                          :
                      Colors.grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
      )
    ]);
  }
}