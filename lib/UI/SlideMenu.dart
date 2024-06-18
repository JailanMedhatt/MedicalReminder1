// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
//
// import 'homePage.dart';
//
// class SlideMenu extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         body: SliderDrawer(
//           key: key,
//           appBar: SliderAppBar(
//               //appBarColor: Colors.white,
//                title: Text("",
//                  style: const TextStyle(
//                      fontSize: 22, fontWeight: FontWeight.w700))),
//           slider: Container(color: Colors.red),
//           child: HomePage(),
//         ));
//   }
//
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/UI/Appointemnt.dart';
import 'package:finalproject1/UI/HelpPage.dart';
import 'package:finalproject1/UI/Login.dart';
import 'package:finalproject1/UI/MapPage.dart';
import 'package:finalproject1/UI/MissedMedicines.dart';
import 'package:finalproject1/UI/PatientHistory.dart';
import 'package:finalproject1/UI/Reminder.dart';
import 'package:finalproject1/UI/profile/Profile.dart';
import 'package:finalproject1/myTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/list_provider.dart';

class SlideMenu extends StatefulWidget {
  @override
  _SlideMenuState createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    var MyProvider = Provider.of<AppointmentProvider>(context);

    var listProvider = Provider.of<ListProvider>(context);
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary.withOpacity(0.80),


            ],
            //colors: [Color(0xff5D65B0), Colors.white12.withOpacity(0.65)],

          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      //backdropColor: Colors.white,
      openRatio: 0.75,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black,
        //
        //     //blurRadius: 5,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child:  Scaffold(
          body:
          Container(
            decoration:BoxDecoration(
              image:listProvider.getBackgroundImage(),
              // image: DecorationImage(
              //   image: AssetImage("assets/images/bk.png"),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(width: 10),
                      IconButton(
                        onPressed: _handleMenuButtonPressed,
                        icon: ValueListenableBuilder<AdvancedDrawerValue>(
                          valueListenable: _advancedDrawerController,
                          builder: (_, value, __) {
                            return AnimatedSwitcher(
                              duration: Duration(milliseconds: 250),
                              child: Icon(
                                value.visible ? Icons.clear : Icons.menu,
                                key: ValueKey<bool>(value.visible),
                              ),
                            );
                          },
                        ),
                      ),

                      //SizedBox(width: 290),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () async
                              {
                               SharedPref.removeId();
                               MyProvider.appointmentList = [];
                                Navigator.pushReplacementNamed(context, LoginPage.routeName);
                              },
                              icon: Icon(
                                Icons.logout_outlined,
                                size: 25,
                              )),
                          Text(AppLocalizations.of(context)!.log_out)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox.square(
                  dimension: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 155.w,
                      width: 160.h,
                      padding: EdgeInsets.all(20.h),
                      decoration: BoxDecoration(
                          color:listProvider.isDarkMode()?
                          Color(0xD3151535):
                          Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(5.0, 5.0), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox.square(
                            dimension: 10,
                          ),
                          Icon(
                            Icons.notifications_active,
                            size: 50,
                            color: listProvider.isDarkMode()?
                            MyTheme.icondark
                                :
                            MyTheme.iconlight,
                          ),
                          SizedBox.square(
                            dimension: 25,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, Reminder.routeName);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.reminder,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    ///de el zyadaaa
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "Schedule");
                      },
                      child: Container(
                        height: 155.w,
                        width: 160.h,
                        padding: EdgeInsets.all(20.h),
                        decoration: BoxDecoration(
                            color:listProvider.isDarkMode()?
                            Color(0xFFC3D0E6):
                            Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 5.0), // changes position of shadow
                            ),
                          ],),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox.square(
                              dimension: 10,
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 50,
                              color: listProvider.isDarkMode()?
                              //MyTheme.icondark
                              Color(0xFF151535)
                                  :
                              MyTheme.iconlight,
                              //Color(0xff5D65B0),
                            ),
                            SizedBox.square(
                              dimension: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.schedule,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),
                                ),
                                // Text(
                                //     AppLocalizations.of(context)!.schedule_reminders,
                                //   style: listProvider.isDarkMode()?
                                //   Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.whiteColor)
                                //       :
                                //   Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16)
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 155.w,
                      width: 160.h,
                      padding: EdgeInsets.all(20.h),
                      decoration: BoxDecoration(
                          color:listProvider.isDarkMode()?
                              Color(0xffc3d0e7):
                          Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 5.0), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox.square(
                            dimension: 10,
                          ),
                          Icon(
                            Icons.live_help,
                            size: 50,
                            color: listProvider.isDarkMode()?
                                Color(0xFF151535)
                           // MyTheme.icondark
                                :
                            MyTheme.iconlight,
                          ),
                          SizedBox.square(
                            dimension: 25,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, HelpScreen.routeName);

                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.help,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),
                                ),
                                // Text(
                                //   AppLocalizations.of(context)!.schedule_reminders,
                                //   style:listProvider.isDarkMode()?
                                //   Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.whiteColor)
                                //       :
                                //   Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16)
                                //   ,
                                //   //TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    ///de el zyadaaa
                    Container(
                      height: 155.w,
                      width: 160.h,
                      padding: EdgeInsets.all(20.h),
                      decoration: BoxDecoration(
                          color: listProvider.isDarkMode()?
                          Color(0xed0f1630) :
                          Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(5.0, 5.0), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "Tips");
                        },
                        child: Column(
                          children: [
                            SizedBox.square(
                              dimension: 10,
                            ),
                            Icon(
                              Icons.health_and_safety,
                              size: 50,
                              color:listProvider.isDarkMode()?
                              MyTheme.icondark
                                  :
                              MyTheme.iconlight,
                            ),
                            SizedBox.square(
                              dimension: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.health_Tips,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),
                                ),
                                // Text(
                                //   AppLocalizations.of(context)!.schedule_reminders,
                                //   style: listProvider.isDarkMode()?
                                //   Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.whiteColor)
                                //       :
                                //   Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Expanded(child:listProvider.isDarkMode()
                 ? Image(image: AssetImage("assets/images/Hdarkpic.png"))
                  :
                  Image(image: AssetImage("assets/images/pic.jpg"))

      )
              ],
            ),

          )



      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/prof.png',
                  ),
                ),
                Container(
                  color: Colors.white12,
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, Profile.routeName);
                    },
                    leading: Icon(Icons.person,size: 37),
                    title: Text(AppLocalizations.of(context)!.profile),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,
                  child: ListTile(
                    onTap: () {

                      listProvider.changeTheme(ThemeMode.dark);
                    },
                    leading: Icon(Icons.brightness_6,size: 37),
                    title: Text(listProvider.isDarkMode() ?
                    AppLocalizations.of(context)!.dark
                        :
                    AppLocalizations.of(context)!.light,),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,

                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, PatientHistory.routeName);

                    },
                    leading: Icon(Icons.history,size: 37),
                    title: Text(AppLocalizations.of(context)!.patient_History),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,

                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, TaskListTab.routeName);
                    },
                    leading: Icon(Icons.timelapse,size: 37),
                    title: Text(AppLocalizations.of(context)!.appointment),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,

                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MapPage.routeName);
                    },
                    leading: Icon(Icons.local_hospital,size: 37),
                    title: Text(AppLocalizations.of(context)!.nearby_Hospitals),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,

                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MissedMedicines.routeName);
                    },
                    leading: Icon(Icons.medical_information,size: 37),
                    title: Text(AppLocalizations.of(context)!.missed_Medicines),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,

                  child: ListTile(
                    onTap: () {
                      listProvider.changeLanguage('ar');
                    },
                    leading: Icon(Icons.language,size: 37),
                    title: Text(AppLocalizations.of(context)!.language,
                      //'Language'
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}