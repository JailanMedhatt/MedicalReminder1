import 'package:finalproject1/UI/Login.dart';
import 'package:finalproject1/UI/MissedMedicines.dart';
import 'package:finalproject1/UI/Profile.dart';
import 'package:finalproject1/UI/Register.dart';
import 'package:finalproject1/UI/Scedhule.dart';
import 'package:finalproject1/UI/SlideMenu.dart';
import 'package:finalproject1/UI/TipsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      child: MaterialApp(
        initialRoute: LoginPage.routeName,
        routes: {
          // 'HomeScreen' :(context) => HomePage(),
          'Schedule': (context) => SchadualePgae(),
          'Tips': (context) => TipsPage(),
          'SlideMenu': (context) => SlideMenu(),
          LoginPage.routeName: (context) => LoginPage(),
          Register.routeName: (context) => Register(),
          Profile.routeName: (context) => Profile(),
          MissedMedicines.routeName: (context) => MissedMedicines(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: HomePage(),
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
