import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Utils {
  static Future<String> downloadFile(String url, String fileName) async{
    // await showDialog<void>(
    //   context: context,
    //   builder: (BuildContext context) => AlertDialog(
    //     content: activeNotificationsDialogContent,
    //     actions: <Widget>[
    //       TextButton(
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //         child: const Text('OK'),
    //       ),
    //     ],
    //   ),
    // );
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$fileName';
  final response = await http.get(Uri.parse(url));
  final file = File(filePath);
  await file.writeAsBytes (response.bodyBytes);
  return filePath;
}
}
