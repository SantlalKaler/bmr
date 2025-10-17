import 'dart:convert';

/// emp_name : "Urukundu KG"
/// id : "579"
/// region_id : "2"

RegionBasedEmployee regionBasedEmployeeFromJson(String str) =>
    RegionBasedEmployee.fromJson(json.decode(str));
String regionBasedEmployeeToJson(RegionBasedEmployee data) =>
    json.encode(data.toJson());

class RegionBasedEmployee {
  RegionBasedEmployee({
    String? empName,
    String? id,
    String? regionId,
  }) {
    _empName = empName;
    _id = id;
    _regionId = regionId;
  }

  RegionBasedEmployee.fromJson(dynamic json) {
    _empName = json['emp_name'];
    _id = json['id'];
    _regionId = json['region_id'];
  }
  String? _empName;
  String? _id;
  String? _regionId;
  RegionBasedEmployee copyWith({
    String? empName,
    String? id,
    String? regionId,
  }) =>
      RegionBasedEmployee(
        empName: empName ?? _empName,
        id: id ?? _id,
        regionId: regionId ?? _regionId,
      );
  String? get empName => _empName;
  String? get id => _id;
  String? get regionId => _regionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emp_name'] = _empName;
    map['id'] = _id;
    map['region_id'] = _regionId;
    return map;
  }
}
