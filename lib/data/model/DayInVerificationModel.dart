import 'dart:convert';
/// success : "1"
/// messsage : "Already Checked-IN"
/// update_id : "160578"
/// checkin_time : "2025-08-10 12:00:10"
/// starting_meter : "4848"

DayInVerificationModel dayInVerificationModelFromJson(String str) => DayInVerificationModel.fromJson(json.decode(str));
String dayInVerificationModelToJson(DayInVerificationModel data) => json.encode(data.toJson());
class DayInVerificationModel {
  DayInVerificationModel({
      String? success, 
      String? messsage, 
      String? updateId, 
      String? checkinTime, 
      String? startingMeter,}){
    _success = success;
    _messsage = messsage;
    _updateId = updateId;
    _checkinTime = checkinTime;
    _startingMeter = startingMeter;
}

  DayInVerificationModel.fromJson(dynamic json) {
    _success = json['success'];
    _messsage = json['messsage'];
    _updateId = json['update_id'];
    _checkinTime = json['checkin_time'];
    _startingMeter = json['starting_meter'];
  }
  String? _success;
  String? _messsage;
  String? _updateId;
  String? _checkinTime;
  String? _startingMeter;
DayInVerificationModel copyWith({  String? success,
  String? messsage,
  String? updateId,
  String? checkinTime,
  String? startingMeter,
}) => DayInVerificationModel(  success: success ?? _success,
  messsage: messsage ?? _messsage,
  updateId: updateId ?? _updateId,
  checkinTime: checkinTime ?? _checkinTime,
  startingMeter: startingMeter ?? _startingMeter,
);
  String? get success => _success;
  String? get messsage => _messsage;
  String? get updateId => _updateId;
  String? get checkinTime => _checkinTime;
  String? get startingMeter => _startingMeter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['messsage'] = _messsage;
    map['update_id'] = _updateId;
    map['checkin_time'] = _checkinTime;
    map['starting_meter'] = _startingMeter;
    return map;
  }

}