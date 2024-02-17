// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/bk.png"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(
//                 height: 60,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child:
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     //SizedBox(width: 10),
//                     IconButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, "SlideMenu");
//                         },
//                         icon: Icon(
//                           Icons.list,
//                           size: 40,
//                         )),
//
//                     //SizedBox(width: 290),
//                     Column(
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.logout_outlined,
//                               size: 25,
//                             )),
//                         Text("LOG OUT")
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox.square(
//                 dimension: 50,
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, "Schedule");
//                 },
//                 child: Row(
//                   children: [
//                     SizedBox.square(
//                       dimension: 10,
//                     ),
//                     Icon(
//                       Icons.calendar_month_outlined,
//                       size: 50,
//                       color: Color(0xff5D65B0),
//                     ),
//                     SizedBox.square(
//                       dimension: 25,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Scahduale",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 22),
//                         ),
//                         Text(
//                           "scaduale to your reminders ",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox.square(
//                 dimension: 20,
//               ),
//               Row(
//                 children: [
//                   SizedBox.square(
//                     dimension: 10,
//                   ),
//                   Icon(
//                     Icons.notifications_active,
//                     size: 50,
//                     color: Color(0xff5D65B0),
//                   ),
//                   SizedBox.square(
//                     dimension: 25,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Reminder",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22),
//                       ),
//                       Text(
//                         "scaduale to your reminders",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox.square(
//                 dimension: 20,
//               ),
//               Row(
//                 children: [
//                   SizedBox.square(
//                     dimension: 10,
//                   ),
//                   Icon(
//                     Icons.live_help,
//                     size: 50,
//                     color: Color(0xff5D65B0),
//                   ),
//                   SizedBox.square(
//                     dimension: 25,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Help",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22),
//                       ),
//                       Text(
//                         "scaduale to your reminders",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox.square(
//                 dimension: 20,
//               ),
//               Row(
//                 children: [
//                   SizedBox.square(
//                     dimension: 10,
//                   ),
//                   Icon(
//                     Icons.health_and_safety,
//                     size: 50,
//                     color: Color(0xff5D65B0),
//                   ),
//                   SizedBox.square(
//                     dimension: 25,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Health Tips",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22),
//                       ),
//                       Text(
//                         "scaduale to your reminders",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               Expanded(child: Image(image: AssetImage("assets/images/pic.jpg")))
//             ],
//           ),
//         )

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
//     );
//   }
//
// }