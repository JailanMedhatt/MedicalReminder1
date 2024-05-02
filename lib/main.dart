import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/UI/Appointemnt.dart';
import 'package:finalproject1/UI/Edit%20Medicine.dart';
import 'package:finalproject1/UI/HelpPage.dart';
import 'package:finalproject1/UI/Login.dart';
import 'package:finalproject1/UI/MapPage.dart';
import 'package:finalproject1/UI/MissedMedicines.dart';
import 'package:finalproject1/UI/NotePage.dart';
import 'package:finalproject1/UI/PatientHistory.dart';
import 'package:finalproject1/UI/Profile.dart';
import 'package:finalproject1/UI/Register.dart';
import 'package:finalproject1/UI/Scedhule.dart';
import 'package:finalproject1/UI/SlideMenu.dart';
import 'package:finalproject1/UI/TipsPage.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'NotificationService.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'myTheme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await Firebase.initializeApp();
  runApp( ChangeNotifierProvider (
      create: (contex) => ListProvider()
      ,child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375,812),
      child: MaterialApp(
        initialRoute: SharedPref.getId()!=null?"SlideMenu": LoginPage.routeName,
        routes: {
          // 'HomeScreen' :(context) => HomePage(),

          'Schedule': (context) => DropdownMenuBottom(),
          'Tips': (context) => TipsPage(),
          'SlideMenu': (context) => SlideMenu(),
          'Note': (context) => NotePage(),
          LoginPage.routeName: (context) => LoginPage(),
          Register.routeName: (context) => Register(),
          EditMedicine.routeName: (context) => EditMedicine(),
          MissedMedicines.routeName: (context) => MissedMedicines(),
          Profile.routeName: (context) => Profile(),
          PatientHistory.routeName: (context) => PatientHistory(),
          HelpScreen.routeName: (context) => HelpScreen(),
          TaskListTab.routeName: (context) => TaskListTab(),
          MapPage.routeName: (context) => MapPage(),





        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        themeMode: listProvider.appTheme ,
        darkTheme: MyTheme.darkTheme,

        home: EditMedicine(),

      ),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//       ),
//     );
//   }
// }
