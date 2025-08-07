import 'dart:convert';

/// id : "1"
/// zone_name : "AP-1"
/// state : "Andhra Pradesh"
/// district : ""
/// geo_jason : "{\"points\":[{\"lat\":\"14.464114891773258\",\"lng\":\"79.98224134910525\"},{\"lat\":\"14.149930551828554\",\"lng\":\"79.84154188071861\"},{\"lat\":\"13.941101948309566\",\"lng\":\"79.91665567903719\"},{\"lat\":\"13.887996847472321\",\"lng\":\"80.0617993380268\"},{\"lat\":\"13.828234398737635\",\"lng\":\"80.15334430406809\"},{\"lat\":\"13.830040629213544\",\"lng\":\"80.20392615345337\"},{\"lat\":\"13.95874571329662\",\"lng\":\"80.18905447533123\"},{\"lat\":\"14.086116582942761\",\"lng\":\"80.16592194228659\"},{\"lat\":\"14.23484016956071\",\"lng\":\"80.13273247847775\"},{\"lat\":\"14.343140549430835\",\"lng\":\"80.15356442088\"},{\"lat\":\"14.469286348143395\",\"lng\":\"80.18512488651338\"},{\"lat\":\"14.521014329699316\",\"lng\":\"80.20297386326426\"},{\"lat\":\"14.601386358542175\",\"lng\":\"80.18509712575269\"},{\"lat\":\"14.697701615097897\",\"lng\":\"80.14523578802165\"},{\"lat\":\"14.734683193781356\",\"lng\":\"80.12559197575622\"},{\"lat\":\"14.763691897991778\",\"lng\":\"80.10181901377221\"},{\"lat\":\"14.900032159480112\",\"lng\":\"80.08033700394382\"},{\"lat\":\"15.11823321562177\",\"lng\":\"80.0565833184816\"},{\"lat\":\"15.440594025363453\",\"lng\":\"80.14644510486464\"},{\"lat\":\"15.738575205348317\",\"lng\":\"80.4103684642604\"},{\"lat\":\"15.739866602012196\",\"lng\":\"80.80661136699\"},{\"lat\":\"15.899760448086468\",\"lng\":\"81.18150994140022\"},{\"lat\":\"16.14106640887875\",\"lng\":\"81.2004403793567\"},{\"lat\":\"16.340113321357038\",\"lng\":\"81.37339549053371\"},{\"lat\":\"16.36775008778824\",\"lng\":\"81.17268162251467\"},{\"lat\":\"16.310848918768073\",\"lng\":\"80.96101227345659\"},{\"lat\":\"16.164819943495594\",\"lng\":\"80.68546178660037\"},{\"lat\":\"16.17562656199406\",\"lng\":\"80.58141160392171\"},{\"lat\":\"16.249704098876755\",\"lng\":\"80.51577779330442\"},{\"lat\":\"16.36640593373393\",\"lng\":\"80.41159909474577\"},{\"lat\":\"16.099236787405385\",\"lng\":\"80.15756969798197\"},{\"lat\":\"16.213797874215068\",\"lng\":\"79.61022821977251\"},{\"lat\":\"15.962137937316122\",\"lng\":\"79.71575066414134\"},{\"lat\":\"15.817777983680434\",\"lng\":\"80.04577465065\"},{\"lat\":\"15.676844084011087\",\"lng\":\"80.14205722034927\"},{\"lat\":\"15.5119824610099\",\"lng\":\"79.98845207417901\"},{\"lat\":\"15.450102254488629\",\"lng\":\"79.61410754661226\"},{\"lat\":\"15.190922853339252\",\"lng\":\"79.9891012235086\"},{\"lat\":\"15.04829750904536\",\"lng\":\"79.82560023808138\"}]}"
/// zone_area : "13468177661.568354"
/// incharge_level_one : "59"
/// incharge_level_two : null
/// incharge_level_three : null

Zone zoneFromJson(String str) => Zone.fromJson(json.decode(str));
String zoneToJson(Zone data) => json.encode(data.toJson());

class Zone {
  Zone({
    String? id,
    String? zoneName,
    String? state,
    String? district,
    String? geoJason,
    String? zoneArea,
    String? inchargeLevelOne,
    dynamic inchargeLevelTwo,
    dynamic inchargeLevelThree,
  }) {
    _id = id;
    _zoneName = zoneName;
    _state = state;
    _district = district;
    _geoJason = geoJason;
    _zoneArea = zoneArea;
    _inchargeLevelOne = inchargeLevelOne;
    _inchargeLevelTwo = inchargeLevelTwo;
    _inchargeLevelThree = inchargeLevelThree;
  }

  Zone.fromJson(dynamic json) {
    _id = json['id'];
    _zoneName = json['zone_name'];
    _state = json['state'];
    _district = json['district'];
    _geoJason = json['geo_jason'];
    _zoneArea = json['zone_area'];
    _inchargeLevelOne = json['incharge_level_one'];
    _inchargeLevelTwo = json['incharge_level_two'];
    _inchargeLevelThree = json['incharge_level_three'];
  }
  String? _id;
  String? _zoneName;
  String? _state;
  String? _district;
  String? _geoJason;
  String? _zoneArea;
  String? _inchargeLevelOne;
  dynamic _inchargeLevelTwo;
  dynamic _inchargeLevelThree;
  Zone copyWith({
    String? id,
    String? zoneName,
    String? state,
    String? district,
    String? geoJason,
    String? zoneArea,
    String? inchargeLevelOne,
    dynamic inchargeLevelTwo,
    dynamic inchargeLevelThree,
  }) =>
      Zone(
        id: id ?? _id,
        zoneName: zoneName ?? _zoneName,
        state: state ?? _state,
        district: district ?? _district,
        geoJason: geoJason ?? _geoJason,
        zoneArea: zoneArea ?? _zoneArea,
        inchargeLevelOne: inchargeLevelOne ?? _inchargeLevelOne,
        inchargeLevelTwo: inchargeLevelTwo ?? _inchargeLevelTwo,
        inchargeLevelThree: inchargeLevelThree ?? _inchargeLevelThree,
      );
  String? get id => _id;
  String? get zoneName => _zoneName;
  String? get state => _state;
  String? get district => _district;
  String? get geoJason => _geoJason;
  String? get zoneArea => _zoneArea;
  String? get inchargeLevelOne => _inchargeLevelOne;
  dynamic get inchargeLevelTwo => _inchargeLevelTwo;
  dynamic get inchargeLevelThree => _inchargeLevelThree;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['zone_name'] = _zoneName;
    map['state'] = _state;
    map['district'] = _district;
    map['geo_jason'] = _geoJason;
    map['zone_area'] = _zoneArea;
    map['incharge_level_one'] = _inchargeLevelOne;
    map['incharge_level_two'] = _inchargeLevelTwo;
    map['incharge_level_three'] = _inchargeLevelThree;
    return map;
  }
}
