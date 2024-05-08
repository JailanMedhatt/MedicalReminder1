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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'How many pills are taken in each dose?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 12),
          Material(
            elevation: 18,
            color: Colors.transparent,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0xffEDF2F3),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FittedBox(
                    child: Container(
                      height: 20,
                      width: 20,
                      child: RawMaterialButton(
                        onPressed: add,
                        elevation: 2.0,
                        fillColor: Color(0xff5D65B0),
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${widget.n}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  FittedBox(
                    child: Container(
                      height: 20,
                      width: 20,
                      child: RawMaterialButton(
                        onPressed: minus,
                        elevation: 2.0,
                        fillColor: Color(0xff5D65B0),
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
