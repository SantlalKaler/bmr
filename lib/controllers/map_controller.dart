import 'package:bmr/data/api_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as lct;
import 'package:permission_handler/permission_handler.dart';

import '../ui/constants/constant.dart';
import '../utils/permission_handler.dart';

class MapController extends GetxController {
  RxBool permissionGranted = true.obs;
  RxBool gpsEnabled = true.obs;
  RxBool loading = false.obs;
  ApiService apiService = ApiService();
  lct.LocationData? currentLocation;

  setLoading() => loading.value = !loading.value;

  Future<bool> locationPermissionGranted() async {
    permissionGranted.value = await isPermissionGranted(Permission.location);
    return permissionGranted.value;
  }

  checkGpsStatus() async {
    gpsEnabled.value = await Geolocator.isLocationServiceEnabled();
    update();
  }

/*  Future<Position?> getCurrentLocationB() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      AppSnackBar.showSnackBar("Location services are disabled.");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        AppSnackBar.showSnackBar(
          'Location permissions are denied',
        );
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      AppSnackBar.showSnackBar(
        'Location permissions are denied',
      );
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Constant.printValue("Current location in B is fetching");
    var currentLocation = await Geolocator.getCurrentPosition();
    Constant.printValue("Current location in B is $currentLocation");
    return currentLocation;
  }*/

  // check if location permission is granted

  // get user current location
  Future<lct.LocationData?> getCurrentLocation() async {
    // check if permission is granted
    if (!await locationPermissionGranted() || !await locationServiceEnabled()) {
      Constant.printValue(
          "Location permission not granted or service disabled");
      Get.snackbar("Permission Denied", "Please enable location permission.");
      return null;
    }

    // setLoading();
    lct.Location location = lct.Location();
    try {
      Constant.printValue("Fetching current location ...");
      currentLocation = await location.getLocation();
      Constant.printValue("Current location is $currentLocation");
      return currentLocation;
    } catch (e) {
      Constant.printValue("Error getting current location: $e");
      Get.snackbar(
          "Error", "Unable to get current location. Please try again.");
      return null;
    }
  }

  Future<bool> locationServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }
}
