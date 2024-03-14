import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorWidget extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final String time;

  DoctorWidget({
    required this.doctorName,
    required this.speciality,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[350],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FaIcon(
                  FontAwesomeIcons.userMd,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  '$time',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        doctorName,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        speciality,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleButtonWithText(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleButtonWithText extends StatefulWidget {
  @override
  _CircleButtonWithTextState createState() => _CircleButtonWithTextState();
}

class _CircleButtonWithTextState extends State<CircleButtonWithText> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[350],
          child: IconButton(
            icon: Icon(
              isChecked ? Icons.check_circle : Icons.circle_outlined,
              color: Colors.deepPurple,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
          ),
        ),
        SizedBox(width: 8),
        Text(
          isChecked ? 'Done' : 'Confirm',
          style: TextStyle(color: Colors.deepPurple),
        ),
      ],
    );
  }
}
