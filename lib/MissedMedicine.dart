// ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:finalproject1/myTheme.dart';
// import 'package:finalproject1/providers/list_provider.dart';
//
// class MissedMedicines extends StatefulWidget {
//   static const String routeName = "missed-meds";
//
//   const MissedMedicines({super.key});
//
//   @override
//   _MissedMedicinesState createState() => _MissedMedicinesState();
// }
//
// class _MissedMedicinesState extends State<MissedMedicines> {
//   //late FirebaseMessaging messaging;
//
//   @override
//   void initState() {
//     super.initState();
//     // messaging = FirebaseMessaging.instance;
//     //
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     //   if (message.notification != null) {
//     //     ScaffoldMessenger.of(context).showSnackBar(
//     //       SnackBar(
//     //         content: Text(message.notification!.body!),
//     //       ),
//     //     );
//     //   }
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var listProvider = Provider.of<ListProvider>(context);
//     return Stack(children: [
//       Container(
//         decoration: BoxDecoration(
//           image: listProvider.getBackgroundImage(),
//         ),
//       ),
//       Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           scrolledUnderElevation: 0,
//           elevation: 0.0,
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back, size: 32),
//           ),
//           title: Text(
//             AppLocalizations.of(context)!.missed_Medicines,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
//           ),
//         ),
//         body: ListView.builder(
//           itemCount: listProvider.missedMedicines.length,
//           itemBuilder: (context, index) {
//             var missedMedicine = listProvider.missedMedicines[index];
//             return Column(
//               children: [
//                 SizedBox(
//                   height: 60,
//                   width: MediaQuery.of(context).size.width * 0.97,
//                 ),
//                 Stack(
//                   alignment: Alignment.topCenter,
//                   clipBehavior: Clip.none,
//                   children: [
//                     Center(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: Container(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           color: listProvider.isDarkMode()
//                               ? MyTheme.n.withOpacity(0.80)
//                               : const Color(0xffEDF2F3),
//                           width: 310,
//                           height: 130,
//                           child: ListView.builder(
//                             padding: EdgeInsets.only(top: 20.h, bottom: 10),
//                             itemCount: 1,
//                             itemBuilder: (context, medIndex) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 17.w),
//                                     const Icon(Icons.error_outline),
//                                     const SizedBox(width: 10),
//                                     Text(
//                                       "${missedMedicine.name}       2 pills",
//                                       style: const TextStyle(
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     Column(
//                                       children: List.generate(2, (checkboxIndex) {
//                                         return Checkbox(
//                                           value: false,
//                                           onChanged: (bool? value) {
//                                             setState(() {
//                                               if (!value!) {
//                                                 listProvider.addMissedMedicine(missedMedicine.day, missedMedicine.name);
//                                               }
//                                             });
//                                           },
//                                         );
//                                       }),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: -45.h,
//                       child: CircleAvatar(
//                         backgroundColor: listProvider.isDarkMode()
//                             ? MyTheme.p.withOpacity(0.80)
//                             : const Color(0xff5D65B0).withOpacity(0.54),
//                         maxRadius: 33,
//                         child: Text(
//                           missedMedicine.day,
//                           style: listProvider.isDarkMode()
//                               ? Theme.of(context).textTheme.titleMedium
//                               : Theme.of(context).textTheme.titleMedium,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     ]);
//   }
// }
