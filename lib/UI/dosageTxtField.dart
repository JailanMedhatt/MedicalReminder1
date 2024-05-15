import 'package:flutter/material.dart';

class DoseTxtF extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final Function()? onAddPressed;
  final Function()? onRemovePressed;

  DoseTxtF({
    required this.controller,
    this.width,
    this.onAddPressed,
    this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 330,
          child: Row(
            children: [
              Text(
                'Dosage Of Medicine ',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff5D65B0),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.medication_liquid_sharp,
                color: Color(0xff5D65B0),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xEDF2F3).withOpacity(0.99),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 4), // Shadow position
              ),
            ],
          ),
          width: width ?? 340,
          height: 42,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.add, color: Color(0xff5D65B0)),
                onPressed: () {
                  final value = int.tryParse(controller.text) ?? 0;
                  controller.text = (value + 1).toString();
                  if (onAddPressed != null) {
                    onAddPressed!();
                  }
                },
              ),
              Expanded(
                child: TextFormField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter text';
                    }
                    return null;
                  },
                  controller: controller,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Color(0xff5D65B0),
                ),
                onPressed: () {
                  final value = int.tryParse(controller.text) ?? 0;
                  if (value > 0) {
                    controller.text = (value - 1).toString();
                  }
                  if (onRemovePressed != null) {
                    onRemovePressed!();
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 7,
        )
      ],
    );
  }
}
