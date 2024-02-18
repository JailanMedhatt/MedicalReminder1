import 'package:flutter/material.dart';

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
            leading: Icon(Icons.arrow_back, size: 32),
            title: Text(
              'Missed Medicines',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            )),
        body: ListView.builder(
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(
                height: 50,
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
                          color: Color(0xffEDF2F3),
                          width: 310,
                          height: 130,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 39),
                            itemBuilder: (context, index) => Row(
                              children: [
                                SizedBox(
                                  width: 17,
                                ),
                                Icon(
                                  Icons.error_outline,
                                ),
                                Text(
                                  " Calcitas-D       2 pills",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            itemCount: 2,
                          )),
                    ),
                  ),
                  Positioned(
                    top: -34,
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
