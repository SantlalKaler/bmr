import 'dart:convert';

/// id : "11537973"
/// timestamp : "2025-10-07 19:54:17"
/// emp_id : "579"
/// gps_coordinates : "{\"lat\":\"28.1996461\",\"lon\":\"75.3634647\"}"
/// battery_level : "100"
/// device_id : "39927732-e807-444b-948a-4c5920534e21"
/// emp_name : "Urukundu KG"
/// datetime : "19:54:17"

EmployeeLocation employeeLocationFromJson(String str) =>
    EmployeeLocation.fromJson(json.decode(str));
String employeeLocationToJson(EmployeeLocation data) =>
    json.encode(data.toJson());

class EmployeeLocation {
  EmployeeLocation({
    String? id,
    String? timestamp,
    String? empId,
    String? gpsCoordinates,
    String? batteryLevel,
    String? deviceId,
    String? empName,
    String? datetime,
  }) {
    _id = id;
    _timestamp = timestamp;
    _empId = empId;
    _gpsCoordinates = gpsCoordinates;
    _batteryLevel = batteryLevel;
    _deviceId = deviceId;
    _empName = empName;
    _datetime = datetime;
  }

  EmployeeLocation.fromJson(dynamic json) {
    _id = json['id'];
    _timestamp = json['timestamp'];
    _empId = json['emp_id'];
    _gpsCoordinates = json['gps_coordinates'];
    _batteryLevel = json['battery_level'];
    _deviceId = json['device_id'];
    _empName = json['emp_name'];
    _datetime = json['datetime'];
  }
  String? _id;
  String? _timestamp;
  String? _empId;
  String? _gpsCoordinates;
  String? _batteryLevel;
  String? _deviceId;
  String? _empName;
  String? _datetime;
  EmployeeLocation copyWith({
    String? id,
    String? timestamp,
    String? empId,
    String? gpsCoordinates,
    String? batteryLevel,
    String? deviceId,
    String? empName,
    String? datetime,
  }) =>
      EmployeeLocation(
        id: id ?? _id,
        timestamp: timestamp ?? _timestamp,
        empId: empId ?? _empId,
        gpsCoordinates: gpsCoordinates ?? _gpsCoordinates,
        batteryLevel: batteryLevel ?? _batteryLevel,
        deviceId: deviceId ?? _deviceId,
        empName: empName ?? _empName,
        datetime: datetime ?? _datetime,
      );
  String? get id => _id;
  String? get timestamp => _timestamp;
  String? get empId => _empId;
  String? get gpsCoordinates => _gpsCoordinates;
  String? get batteryLevel => _batteryLevel;
  String? get deviceId => _deviceId;
  String? get empName => _empName;
  String? get datetime => _datetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['timestamp'] = _timestamp;
    map['emp_id'] = _empId;
    map['gps_coordinates'] = _gpsCoordinates;
    map['battery_level'] = _batteryLevel;
    map['device_id'] = _deviceId;
    map['emp_name'] = _empName;
    map['datetime'] = _datetime;
    return map;
  }
}
