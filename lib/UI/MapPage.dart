// AIzaSyCINpB-sDP7nFNIxWu_q0alAlcod3sr29E

import 'package:finalproject1/MyLocationManager.dart';
import 'package:flutter/material.dart';


class MapPage extends StatefulWidget{
  static const String routeName = "Map";

  @override
  State<MapPage> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {
MyLocationManager locationManager = MyLocationManager();
  @override
  void initState() {
    super.initState();
    trackUserLocation();
  }
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('MAP'),
    centerTitle: true,

  ),

);
  }
  trackUserLocation()async{
   var locationData = await locationManager.getUserLocation();
   print(locationData?.latitude ?? 0);
   print(locationData?.longitude ?? 0);


  }
}