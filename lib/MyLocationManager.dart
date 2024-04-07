import 'package:location/location.dart';

class MyLocationManager {
  Location myLocation = Location();

  Future<bool> isPermissionGranted() async {
    var permissionStatus = await myLocation.hasPermission();
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> requestPermission() async {
    var permissionStatus = await myLocation.requestPermission();
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> isServiceEnabled() async {
    var serviceEnabled = await myLocation.serviceEnabled();
    return serviceEnabled;
  }

  Future<bool> requestService() async {
    var serviceEnabled = await myLocation.requestService();
    return serviceEnabled;
  }

  Future<LocationData?> getUserLocation() async {
    var permissionStatus = await requestPermission();
    var serviceEnabled = await requestService();

    if (!permissionStatus || !serviceEnabled) {
      return null;
    }

    return myLocation.getLocation();
  }

  Stream<LocationData> UpdateLocation(){
    return myLocation.onLocationChanged;
  }
}