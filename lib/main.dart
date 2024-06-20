
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:finalproject1/SharedPref.dart';
import 'package:finalproject1/UI/Appointemnt.dart';
import 'package:finalproject1/UI/Edit%20Medicine.dart';
import 'package:finalproject1/UI/HelpPage.dart';
import 'package:finalproject1/UI/Login.dart';
import 'package:finalproject1/UI/MapPage.dart';
import 'package:finalproject1/UI/MissedMedicines.dart';
import 'package:finalproject1/UI/NotePage.dart';
import 'package:finalproject1/UI/PatientHistory.dart';
import 'package:finalproject1/UI/Reminder.dart';
import 'package:finalproject1/UI/firstHelpScreen.dart';
import 'package:finalproject1/UI/profile/Profile.dart';
import 'package:finalproject1/UI/Register.dart';
import 'package:finalproject1/UI/Scedhule.dart';
import 'package:finalproject1/UI/SlideMenu.dart';
import 'package:finalproject1/UI/TipsPage.dart';
import 'package:finalproject1/UI/secondHelpScreen.dart';
import 'package:finalproject1/providers/list_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'NotificationService.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await Firebase.initializeApp();
  NotificationService().initNotification();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>ListProvider()),
        ChangeNotifierProvider(create: (context)=>AppointmentProvider()),
        ChangeNotifierProvider(create: (context)=>ReminderListProvider()),


      ],child: MyApp()));


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

          'Schedule': (context) =>  SchadualePage(),
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
          Reminder.routeName:(context)=> Reminder(),
          FirstScreenHelpAndSupport.routeName:(context) => FirstScreenHelpAndSupport(),
          SecondScreenHelpAndSupport.routeName:(context) => SecondScreenHelpAndSupport()






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

        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: Locale(listProvider.appLanguage),
        supportedLocales: AppLocalizations.supportedLocales,



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