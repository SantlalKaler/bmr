import 'dart:convert';

/// id : "1"
/// state_name : "Andhra Pradesh"
/// city : ["Anantapur","Chittoor","East Godavari","Guntur","Krishna","Kurnool","Prakasam","Srikakulam","SriPotti Sri Ramulu Nellore","Vishakhapatnam","Vizianagaram","West Godavari","Cudappah"]

StateItem stateItemFromJson(String str) => StateItem.fromJson(json.decode(str));
String stateItemToJson(StateItem data) => json.encode(data.toJson());

class StateItem {
  StateItem({
    String? id,
    String? stateName,
    List<String>? city,
  }) {
    _id = id;
    _stateName = stateName;
    _city = city;
  }

  StateItem.fromJson(dynamic json) {
    _id = json['id'];
    _stateName = json['state_name'];
    _city = json['city'] != null ? json['city'].cast<String>() : [];
  }
  String? _id;
  String? _stateName;
  List<String>? _city;
  StateItem copyWith({
    String? id,
    String? stateName,
    List<String>? city,
  }) =>
      StateItem(
        id: id ?? _id,
        stateName: stateName ?? _stateName,
        city: city ?? _city,
      );
  String? get id => _id;
  String? get stateName => _stateName;
  List<String>? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['state_name'] = _stateName;
    map['city'] = _city;
    return map;
  }
}
