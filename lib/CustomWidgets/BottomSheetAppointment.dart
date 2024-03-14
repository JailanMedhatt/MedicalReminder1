import 'package:flutter/material.dart';

class BottomSheetAppointment extends StatefulWidget {
  @override
  _BottomSheetAppointment createState() => _BottomSheetAppointment();
}

class _BottomSheetAppointment extends State<BottomSheetAppointment> {
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Add Appointment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
            TextField(
              controller: doctorNameController,
              decoration: InputDecoration(
                labelText: 'Doctor\'s Name',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Time', style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: timeController,
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '00:00',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 55),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date', style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Icon(Icons.calendar_today, size: 29),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 29),
            TextField(
              controller: specialityController,
              decoration: InputDecoration(
                labelText: 'Doctor\'s Speciality',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //primary: Colors.deepPurple,
                
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 60),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'SAVE',
                style: TextStyle(fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}