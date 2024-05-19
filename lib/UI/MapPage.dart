// AIzaSyCINpB-sDP7nFNIxWu_q0alAlcod3sr29E
import 'package:finalproject1/MyLocationManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MapPage extends StatefulWidget{
  static const String routeName = "Map";

  @override
  State<MapPage> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {
MyLocationManager locationManager = MyLocationManager();
CameraPosition routeCameraPosition = CameraPosition(target: LatLng(31.2214255,29.9318772),
  zoom: 17
);
Set<Marker> Markers = {
  Marker(markerId: MarkerId('userPosition'),
    position: LatLng(31.2214255,29.9318772),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
  ),
};
  @override
  void initState() {
    super.initState();
    trackUserLocation();
  }
  @override
  Widget build(BuildContext context) {
    locationManager.myLocation.changeSettings(
      distanceFilter: 10,
      interval: 2000
    );
return Scaffold(
  appBar: AppBar(
    title: Text(AppLocalizations.of(context)!.map),
    centerTitle: true,

  ),
body: GoogleMap(initialCameraPosition: routeCameraPosition,
  mapType: MapType.normal,
  markers: Markers,
  onMapCreated: (controller){

  },
),
);
  }
  trackUserLocation()async{
   var locationData = await locationManager.getUserLocation();
   print(locationData?.latitude ?? 0);
   print(locationData?.longitude ?? 0);

   locationManager.UpdateLocation().listen((newUserLocation) {
     print(newUserLocation.longitude);
     print(newUserLocation.latitude);
   });


  }
  // @override
  // void dispose(){
  //   super.dispose();
  //   streamSubscription?.cancel();
  // }


}