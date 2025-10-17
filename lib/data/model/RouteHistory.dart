import 'dart:convert';

/// log_date : "2025-10-07"
/// log_time : "06:26"
/// gps_coordinates : "{\"lat\":\"12.9058172\",\"lon\":\"77.6759604\"}"
/// battery_level : "40"

RouteHistory routeHistoryFromJson(String str) =>
    RouteHistory.fromJson(json.decode(str));
String routeHistoryToJson(RouteHistory data) => json.encode(data.toJson());

class RouteHistory {
  RouteHistory({
    String? logDate,
    String? logTime,
    String? gpsCoordinates,
    String? batteryLevel,
  }) {
    _logDate = logDate;
    _logTime = logTime;
    _gpsCoordinates = gpsCoordinates;
    _batteryLevel = batteryLevel;
  }

  RouteHistory.fromJson(dynamic json) {
    _logDate = json['log_date'];
    _logTime = json['log_time'];
    _gpsCoordinates = json['gps_coordinates'];
    _batteryLevel = json['battery_level'];
  }
  String? _logDate;
  String? _logTime;
  String? _gpsCoordinates;
  String? _batteryLevel;
  RouteHistory copyWith({
    String? logDate,
    String? logTime,
    String? gpsCoordinates,
    String? batteryLevel,
  }) =>
      RouteHistory(
        logDate: logDate ?? _logDate,
        logTime: logTime ?? _logTime,
        gpsCoordinates: gpsCoordinates ?? _gpsCoordinates,
        batteryLevel: batteryLevel ?? _batteryLevel,
      );
  String? get logDate => _logDate;
  String? get logTime => _logTime;
  String? get gpsCoordinates => _gpsCoordinates;
  String? get batteryLevel => _batteryLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['log_date'] = _logDate;
    map['log_time'] = _logTime;
    map['gps_coordinates'] = _gpsCoordinates;
    map['battery_level'] = _batteryLevel;
    return map;
  }
}
