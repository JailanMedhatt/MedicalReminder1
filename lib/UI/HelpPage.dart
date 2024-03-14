import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  static const String routeName = 'help_screen';

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
            backgroundColor: Colors.transparent,
              title: Text(
                'Help & Support',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('FAQs', style: TextStyle(color: Colors.grey, fontSize: 19)),
                      Icon(Icons.arrow_forward, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(right: 16,left: 16),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Contact', style: TextStyle(color: Colors.grey, fontSize: 19)),
                      Icon(Icons.arrow_forward, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
      )
    ]);
  }
}