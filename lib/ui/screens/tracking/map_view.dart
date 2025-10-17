import 'dart:convert';

import 'package:bmr/controllers/employee_controller.dart';
import 'package:bmr/data/pref_data.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../data/model/user.dart';

class MapView extends StatefulWidget {
  final bool currentLocation;
  const MapView({super.key, required this.currentLocation});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController mapController;
  EmployeeController employeeController = Get.find();
  TextEditingController selectedDate = TextEditingController();
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final Set<Marker> _markers = {};
  User? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  getData() async {
    user = await PrefData.getUser();
    if (widget.currentLocation) {
      await employeeController.employeeLiveRoute();
      _loadMarkersForCurrentLocation();
    } else {
      await employeeController.employeeRouteHistory();
      _loadMarkersForRouteHistory();
    }
  }

  void _loadMarkersForCurrentLocation() {
    for (var loc in employeeController.employeeLocation) {
      final decoded = jsonDecode(loc.gpsCoordinates!);

      // Extract values and convert to double
      double lat = double.parse(decoded["lat"]);
      double lon = double.parse(decoded["lon"]);
      _markers.add(
        Marker(
          markerId: MarkerId(lat.toString()),
          position: LatLng(lat, lon),
          infoWindow: InfoWindow(title: loc.empName),
        ),
      );
    }

    // focus on first marker
    final decoded =
        jsonDecode(employeeController.employeeLocation[0].gpsCoordinates!);
    double lat = double.parse(decoded["lat"]);
    double lon = double.parse(decoded["lon"]);
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(lat, lon),
        10,
      ),
    );
  }

  void _loadMarkersForRouteHistory() {
    if (employeeController.routeHistory.isEmpty) return;
    for (var loc in employeeController.routeHistory) {
      final decoded = jsonDecode(loc.gpsCoordinates!);

      // Extract values and convert to double
      double lat = double.parse(decoded["lat"]);
      double lon = double.parse(decoded["lon"]);
      _markers.add(
        Marker(
          markerId: MarkerId(lat.toString()),
          position: LatLng(lat, lon),
          infoWindow: InfoWindow(title: loc.logDate),
        ),
      );
    }

    // focus on first marker
    final decoded =
        jsonDecode(employeeController.routeHistory[0].gpsCoordinates!);
    double lat = double.parse(decoded["lat"]);
    double lon = double.parse(decoded["lon"]);
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(lat, lon),
        2,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // Optionally move camera to first location
    if (employeeController.employeeLocation.isNotEmpty) {
      final decoded =
          jsonDecode(employeeController.employeeLocation[0].gpsCoordinates!);

      // Extract values and convert to double
      double lat = double.parse(decoded["lat"]);
      double lon = double.parse(decoded["lon"]);
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(lat, lon),
          10,
        ),
      );
    }
  }

  resetCamera() {
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(0, 0),
        2,
      ),
    );
    _markers.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
        init: EmployeeController(),
        builder: (controller) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size(
                    double.infinity,
                    widget.currentLocation
                        ? MediaQuery.of(context).size.height / 3.6
                        : MediaQuery.of(context).size.height / 6),
                child: employeeController.loading.isTrue
                    ? const AppLoader()
                    : widget.currentLocation
                        ? employeeController.employeeLocation.isEmpty &&
                                widget.currentLocation
                            ? const SizedBox()
                            : currentLocation()
                        : routeHistory()),
            // body: Text("data"),
            body: GoogleMap(
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              compassEnabled: false,
              zoomGesturesEnabled: true,
              initialCameraPosition:
                  const CameraPosition(target: LatLng(0, 0), zoom: 2),
              markers: _markers,
            ),
          );
        },
      ),
    );
  }

  Widget routeHistory() {
    return Column(
      children: [
        ListTile(
          leading: const Text(
            "Employee Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(user?.empName ?? ""),
        ),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000), // restrict past dates
              lastDate: DateTime.now(), // adjust as needed
            );

            if (pickedDate != null) {
              selectedDate.text = DateFormat('yyyy-MM-dd')
                  .format(pickedDate); // or use your preferred format
              resetCamera();
              await employeeController.employeeRouteHistory(
                  date: pickedDate.toString());
              _loadMarkersForRouteHistory();
            }
          },
          child: TextField(
            controller: selectedDate,
            enabled: false,
            readOnly: true,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                labelText: "Select Date"),
          ),
        )
      ],
    );
  }

  Widget currentLocation() {
    var employee = employeeController.employeeLocation[0];
    //var employee = EmployeeLocation();
    return Column(
      children: [
        ListTile(
          leading: const Text(
            "Employee Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(employee.empName ?? ""),
        ),
        ListTile(
          leading: const Text(
            "Time",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(employee.timestamp ?? ""),
        ),
        ListTile(
          leading: const Text(
            "Battery Level",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(employee.batteryLevel ?? ""),
        ),
      ],
    );
  }
}
