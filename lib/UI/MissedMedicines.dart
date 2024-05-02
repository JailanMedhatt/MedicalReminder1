import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Edit Medicine.dart';

class MissedMedicines extends StatelessWidget {
  static final String routeName = "missed-meds";

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Opening.png"),
          fit: BoxFit.cover,
        ),
      )),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(onPressed: (){Navigator.pop(context);
             }, icon:Icon(Icons.arrow_back, size: 32)),
            title: Text(
              'Missed Medicines',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            )),
        body: ListView.builder(
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.97,
              ),
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                          color: Color(0xffEDF2F3),
                          width: 310,
                          height: 130,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 20.h,bottom: 10),
                            itemBuilder: (context, index) => Row(
                              children: [
                                SizedBox(
                                  width: 17.w,
                                ),
                                Icon(
                                  Icons.error_outline,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, EditMedicine.routeName);
                                  },
                                  child: Text(
                                    " Calcitas-D       2 pills",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            itemCount: 3,
                          )),
                    ),
                  ),
                  Positioned(
                    top: -45.h,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff5D65B0).withOpacity(0.54),
                      maxRadius: 33,
                      child: Text(
                        'mon',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
