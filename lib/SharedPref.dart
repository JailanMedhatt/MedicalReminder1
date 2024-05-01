import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static late  SharedPreferences sharedPreferences;
  static init() async{
    sharedPreferences= await SharedPreferences.getInstance();
  }
  static addId(String id) {
    init();
     sharedPreferences.setString("id", id);

  }
  static void removeId() {
    init();
     sharedPreferences.remove("id");
  }
  static getId() {
    init();
    return  sharedPreferences.getString("id");
  }
}