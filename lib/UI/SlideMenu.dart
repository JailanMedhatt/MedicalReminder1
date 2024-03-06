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
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/UI/Login.dart';
import 'package:finalproject1/UI/MissedMedicines.dart';
import 'package:finalproject1/UI/PatientHistory.dart';
import 'package:finalproject1/UI/Profile.dart';
import 'package:finalproject1/UI/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class SlideMenu extends StatefulWidget {
  @override
  _SlideMenuState createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
             colors: [Color(0xff535a9e), Color(0xff5a5e7e).withOpacity(0.65)],
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
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bk.png"),
                fit: BoxFit.cover,
              ),
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

                                Navigator.pushReplacementNamed(context, LoginPage.routeName);
                              },
                              icon: Icon(
                                Icons.logout_outlined,
                                size: 25,
                              )),
                          Text("LOG OUT")
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox.square(
                  dimension: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "Schedule");
                  },
                  child: Row(
                    children: [
                      SizedBox.square(
                        dimension: 10,
                      ),
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 50,
                        color: Color(0xff5D65B0),
                      ),
                      SizedBox.square(
                        dimension: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Scahduale",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          Text(
                            "scaduale to your reminders ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox.square(
                  dimension: 20,
                ),
                Row(
                  children: [
                    SizedBox.square(
                      dimension: 10,
                    ),
                    Icon(
                      Icons.notifications_active,
                      size: 50,
                      color: Color(0xff5D65B0),
                    ),
                    SizedBox.square(
                      dimension: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reminder",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "scaduale to your reminders",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox.square(
                  dimension: 20,
                ),
                Row(
                  children: [
                    SizedBox.square(
                      dimension: 10,
                    ),
                    Icon(
                      Icons.live_help,
                      size: 50,
                      color: Color(0xff5D65B0),
                    ),
                    SizedBox.square(
                      dimension: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Help",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "scaduale to your reminders",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox.square(
                  dimension: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "Tips");
                  },
                  child: Row(
                    children: [
                      SizedBox.square(
                        dimension: 10,
                      ),
                      Icon(
                        Icons.health_and_safety,
                        size: 50,
                        color: Color(0xff5D65B0),
                      ),
                      SizedBox.square(
                        dimension: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Health Tips",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          Text(
                            "scaduale to your reminders",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(child: Image(image: AssetImage("assets/images/pic.jpg")))
              ],
            ),
          )

        // Stack(
        //   children: [
        //      Container(
        //          width: double.infinity,
        //          child: Image.asset("assets/images/bk.png",fit: BoxFit.fill)),
        //     Column(
        //       children: [
        //         Row(
        //            children: [
        //              Icon(Icons.calendar_month_outlined,color: Colors.purpleAccent,),
        //              SizedBox.square(dimension: 30,),
        //              Column(
        //                children: [
        //                  Text("Scahduale",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        //                  Text("scaduale to your reminders",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        //
        //                ],
        //              )
        //            ],
        //         ),
        //         Row(
        //           children: [
        //             Icon(Icons.calendar_month_outlined,color: Colors.purpleAccent,),
        //             SizedBox.square(dimension: 30,),
        //             Column(
        //               children: [
        //                 Text("Scahduale",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        //                 Text("scaduale to your reminders",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        //
        //               ],
        //             )
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Icon(Icons.calendar_month_outlined,color: Colors.purpleAccent,),
        //             SizedBox.square(dimension: 30,),
        //             Column(
        //               children: [
        //                 Text("Scahduale",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        //                 Text("scaduale to your reminders",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        //
        //               ],
        //             )
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Icon(Icons.calendar_month_outlined,color: Colors.purpleAccent,),
        //             SizedBox.square(dimension: 30,),
        //             Column(
        //               children: [
        //                 Text("Scahduale",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        //                 Text("scaduale to your reminders",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        //
        //               ],
        //             )
        //           ],
        //         )
        //       ],
        //     ),
        //
        //
        //
        //   ],
        //  ),
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
                    title: Text('Profile'),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.brightness_6,size: 37),
                    title: Text('Light'),
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
                    title: Text('Patient History'),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,

                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.timelapse,size: 37),
                    title: Text('Appointment'),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,

                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.local_hospital,size: 37),
                    title: Text('Nearby Hospitals'),
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
                    title: Text('Missed Medicines'),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white12,

                  child: ListTile(
                    onTap: () {},
                    leading: Icon(Icons.language,size: 37),
                    title: Text('Language'),
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