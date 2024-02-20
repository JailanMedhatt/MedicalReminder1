import 'package:flutter/material.dart';

class DialogUtills {
  static void showLoading(BuildContext context) {
    showDialog( barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
            CircularProgressIndicator(

            ),
            SizedBox(
              width: 5,
            ),
            Text("Loading...",style: TextStyle( fontSize: 18),)
          ]));
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(String message, BuildContext context,
      {String? actionName, VoidCallback? action}) {
    List<Widget> actions=[];
    if(actionName!=null){
      actions.add(TextButton(onPressed:(){
        Navigator.pop(context);
        action?.call();

      }, child: Text(actionName,style: TextStyle( fontSize: 18),)));
    }
    showDialog(
        barrierDismissible:false,
        context: context,
        builder: (context){

      return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(message,style: TextStyle( fontSize: 18)),
        ),
        actions:actions,
      );
    });
  }
}
