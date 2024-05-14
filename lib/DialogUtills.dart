import 'package:flutter/material.dart';

class DialogUtills {
  static void showLoading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Loading...",
                  style: TextStyle(fontSize: 18),
                )
              ]));
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(String message, BuildContext context,
  {String? posActionName, VoidCallback? posAction,String mytitle ='',String? negActionName, VoidCallback? negAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();

          },
          child: Text(
            posActionName,
            style: TextStyle(fontSize: 18),
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();

          },
          child: Text(
            negActionName,
            style: TextStyle(fontSize: 18),
          )));
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(

          title: Text(mytitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
            //backgroundColor: Color(0xff535a9e),
            shadowColor: Colors.purple,
            //Colors.purple,
              elevation: 50,
              clipBehavior: Clip.antiAlias,
              //surfaceTintColor: Colors.grey,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
            content: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(message, style: TextStyle(fontSize: 18)),
            ),
            actions: actions,
          );
        });
  }
}
