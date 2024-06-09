import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../myTheme.dart';
import '../providers/list_provider.dart';

class FirstScreenHelpAndSupport extends StatefulWidget {
  static const String routeName = 'First_HelpScreen';
  const FirstScreenHelpAndSupport({super.key});

  @override
  State<FirstScreenHelpAndSupport> createState() =>
      _FirstScreenHelpAndSupportState();
}

class _FirstScreenHelpAndSupportState extends State<FirstScreenHelpAndSupport> {
  //final Color color = const Color(0xff5D65B0);


  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
            image: listProvider.getBackgroundImage(),
          ),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, size: 32)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.help_Support,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 27.sp),
                  ),
                  // InkWell(
                  //   child: Image.asset("assets/images/search.png"),
                  //   onTap: () {},
                  // ),
                ],
              ),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.w,
                        top: 100.h,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.zone_app,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                            color: listProvider.isDarkMode()?
                        MyTheme.i
                        :
                            Color(0xff5D65B0)
                      ,  ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 8.w),
                  child: Text(
                    "CareZone helps you manage and take your medication on time with our first-of-its-kind cloud-synced mobile medication management platform. "
                        "CareZone allows your family, "
                        "friends & caregivers to aid (if you so choose) by  being alerted as to whether or not you took your medication.",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        AppLocalizations.of(context)!.save_data,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color:  listProvider.isDarkMode()?
                            MyTheme.i
                                :
                            Color(0xff5D65B0)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 8.w),
                  child: Text(
                    "While CareZone can be used without creating an\naccount, we highly recommend creating one to prevent the loss of your information. If an account is not created, you will not be able to transfer your history from one device to another if you get a new phone or delete the app. To ensure you always have access to your data and history, please create an account with an email address and password. ",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        AppLocalizations.of(context)!.included_zone,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                            color:  listProvider.isDarkMode()?
                            MyTheme.i
                                :
                            Color(0xff5D65B0)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 8.w),
                  child: Text(
                    "CareZone Premium allows you to add unlimited Carefriends, dependents and health trackers to your account. It will also unlock our Caretone options and let you change the color of the app.",
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
