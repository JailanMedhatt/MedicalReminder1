import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final int n;
  final Function(int) onCountChanged;

  Counter({required this.n, required this.onCountChanged});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  void add() {
    setState(() {
      widget.onCountChanged(widget.n + 1);
    });
  }

  void minus() {
    setState(() {
      if (widget.n != 0) {
        widget.onCountChanged(widget.n - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: add, // Attach add() method to onPressed
          icon: Icon(Icons.add),
        ),
        Text(
          widget.n.toString(),
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
          onPressed: minus, // Attach minus() method to onPressed
          icon: Icon(Icons.remove),
        ),
      ],
    );
  }
}