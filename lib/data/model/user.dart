import 'dart:convert';

/// success : "1"
/// val : "Success"
/// e_id : "425"
/// emp_dep : "19"
/// region_id : "1,2,3,4,5,7,9,14,15,16,17"
/// region_name : "AP-1"
/// cat_id : "5"
/// emp_name : "S Praveen K"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    dynamic success,
    String? val,
    String? eId,
    String? empDep,
    String? regionId,
    String? regionName,
    String? catId,
    String? empName,
  }) {
    _success = success;
    _val = val;
    _eId = eId;
    _empDep = empDep;
    _regionId = regionId;
    _regionName = regionName;
    _catId = catId;
    _empName = empName;
  }

  User.fromJson(dynamic json) {
    _success = json['success'];
    _val = json['val'];
    _eId = json['e_id'];
    _empDep = json['emp_dep'];
    _regionId = json['region_id'];
    _regionName = json['region_name'];
    _catId = json['cat_id'];
    _empName = json['emp_name'];
  }
  dynamic _success;
  String? _val;
  String? _eId;
  String? _empDep;
  String? _regionId;
  String? _regionName;
  String? _catId;
  String? _empName;
  User copyWith({
    dynamic success,
    String? val,
    String? eId,
    String? empDep,
    String? regionId,
    String? regionName,
    String? catId,
    String? empName,
  }) =>
      User(
        success: success ?? _success,
        val: val ?? _val,
        eId: eId ?? _eId,
        empDep: empDep ?? _empDep,
        regionId: regionId ?? _regionId,
        regionName: regionName ?? _regionName,
        catId: catId ?? _catId,
        empName: empName ?? _empName,
      );
  dynamic get success => _success;
  String? get val => _val;
  String? get eId => _eId;
  String? get empDep => _empDep;
  String? get regionId => _regionId;
  String? get regionName => _regionName;
  String? get catId => _catId;
  String? get empName => _empName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['val'] = _val;
    map['e_id'] = _eId;
    map['emp_dep'] = _empDep;
    map['region_id'] = _regionId;
    map['region_name'] = _regionName;
    map['cat_id'] = _catId;
    map['emp_name'] = _empName;
    return map;
  }
}
