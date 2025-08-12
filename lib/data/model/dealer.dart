import 'dart:convert';

/// id : "7"
/// cat_id : "1"
/// first_name : "Magnum Estates (P) Limited"
/// last_name : ""
/// address1 : "Balramgadi,"
/// address2 : "Balasore District,Odisha-751007"
/// city_village : "Odisha"
/// state : "West Bengal"
/// mobile_no : "7008764381"
/// zone_id : "7"
/// comments : "0"
/// customer_type : "Own"
/// own_other : "0"
/// customer_of : "BMR"
/// active_status : "1"
/// is_approved : "0"
/// approved_by : null
/// approved_at : null
/// aadhar_id : null
/// other_id_name : null
/// other_id_value : null
/// primary_geo_json : "0"
/// farm_area : "0"
/// centroid : "0"
/// f_gps : ""
/// l_gps : ""
/// created_by : "1"
/// created_at : "2022-04-27 12:03:26"
/// updated_by : null
/// updated_at : "2022-04-27 12:03:26"
/// zone_name : "West bengal"
/// district : ""
/// geo_jason : "{\"points\":[{\"lat\":\"22.617273843424158\",\"lng\":\"88.36368824625447\"},{\"lat\":\"22.617273843424158\",\"lng\":\"88.36368824625447\"},{\"lat\":\"23.52558646319812\",\"lng\":\"87.21344240050108\"},{\"lat\":\"23.455671024820973\",\"lng\":\"85.72761372049956\"},{\"lat\":\"20.53267344978062\",\"lng\":\"84.1109178723832\"},{\"lat\":\"19.50678488797046\",\"lng\":\"85.26088585015577\"},{\"lat\":\"19.897358215300265\",\"lng\":\"86.16192984855866\"},{\"lat\":\"19.97897584358392\",\"lng\":\"86.36871549517036\"},{\"lat\":\"20.17386911679316\",\"lng\":\"86.60885340546247\"},{\"lat\":\"20.532179308080064\",\"lng\":\"86.85944594625153\"},{\"lat\":\"20.67494528270115\",\"lng\":\"86.96083520556522\"},{\"lat\":\"20.858810000325224\",\"lng\":\"86.95246445834073\"},{\"lat\":\"21.17117829340472\",\"lng\":\"86.82837966554621\"},{\"lat\":\"21.442562208367544\",\"lng\":\"87.00101280549336\"},{\"lat\":\"21.646653427639144\",\"lng\":\"87.79357743495098\"},{\"lat\":\"22.04059285914377\",\"lng\":\"88.15455293590571\"}]}"
/// zone_area : "110342284427.37192"
/// incharge_level_one : "1"
/// incharge_level_two : null
/// incharge_level_three : null

Dealer dealerFromJson(String str) => Dealer.fromJson(json.decode(str));
String dealerToJson(Dealer data) => json.encode(data.toJson());

class Dealer {
  Dealer({
    String? id,
    String? catId,
    String? firstName,
    String? lastName,
    String? address1,
    String? address2,
    String? cityVillage,
    String? state,
    String? mobileNo,
    String? zoneId,
    String? comments,
    String? customerType,
    String? ownOther,
    String? customerOf,
    String? activeStatus,
    String? isApproved,
    dynamic approvedBy,
    dynamic approvedAt,
    dynamic aadharId,
    dynamic otherIdName,
    dynamic otherIdValue,
    String? primaryGeoJson,
    String? farmArea,
    String? centroid,
    String? fGps,
    String? lGps,
    String? createdBy,
    String? createdAt,
    dynamic updatedBy,
    String? updatedAt,
    String? zoneName,
    String? district,
    String? geoJason,
    String? zoneArea,
    String? inchargeLevelOne,
    dynamic inchargeLevelTwo,
    dynamic inchargeLevelThree,
  }) {
    _id = id;
    _catId = catId;
    _firstName = firstName;
    _lastName = lastName;
    _address1 = address1;
    _address2 = address2;
    _cityVillage = cityVillage;
    _state = state;
    _mobileNo = mobileNo;
    _zoneId = zoneId;
    _comments = comments;
    _customerType = customerType;
    _ownOther = ownOther;
    _customerOf = customerOf;
    _activeStatus = activeStatus;
    _isApproved = isApproved;
    _approvedBy = approvedBy;
    _approvedAt = approvedAt;
    _aadharId = aadharId;
    _otherIdName = otherIdName;
    _otherIdValue = otherIdValue;
    _primaryGeoJson = primaryGeoJson;
    _farmArea = farmArea;
    _centroid = centroid;
    _fGps = fGps;
    _lGps = lGps;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _zoneName = zoneName;
    _district = district;
    _geoJason = geoJason;
    _zoneArea = zoneArea;
    _inchargeLevelOne = inchargeLevelOne;
    _inchargeLevelTwo = inchargeLevelTwo;
    _inchargeLevelThree = inchargeLevelThree;
  }

  Dealer.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _cityVillage = json['city_village'];
    _state = json['state'];
    _mobileNo = json['mobile_no'];
    _zoneId = json['zone_id'];
    _comments = json['comments'];
    _customerType = json['customer_type'];
    _ownOther = json['own_other'];
    _customerOf = json['customer_of'];
    _activeStatus = json['active_status'];
    _isApproved = json['is_approved'];
    _approvedBy = json['approved_by'];
    _approvedAt = json['approved_at'];
    _aadharId = json['aadhar_id'];
    _otherIdName = json['other_id_name'];
    _otherIdValue = json['other_id_value'];
    _primaryGeoJson = json['primary_geo_json'];
    _farmArea = json['farm_area'];
    _centroid = json['centroid'];
    _fGps = json['f_gps'];
    _lGps = json['l_gps'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _zoneName = json['zone_name'];
    _district = json['district'];
    _geoJason = json['geo_jason'];
    _zoneArea = json['zone_area'];
    _inchargeLevelOne = json['incharge_level_one'];
    _inchargeLevelTwo = json['incharge_level_two'];
    _inchargeLevelThree = json['incharge_level_three'];
  }
  String? _id;
  String? _catId;
  String? _firstName;
  String? _lastName;
  String? _address1;
  String? _address2;
  String? _cityVillage;
  String? _state;
  String? _mobileNo;
  String? _zoneId;
  String? _comments;
  String? _customerType;
  String? _ownOther;
  String? _customerOf;
  String? _activeStatus;
  String? _isApproved;
  dynamic _approvedBy;
  dynamic _approvedAt;
  dynamic _aadharId;
  dynamic _otherIdName;
  dynamic _otherIdValue;
  String? _primaryGeoJson;
  String? _farmArea;
  String? _centroid;
  String? _fGps;
  String? _lGps;
  String? _createdBy;
  String? _createdAt;
  dynamic _updatedBy;
  String? _updatedAt;
  String? _zoneName;
  String? _district;
  String? _geoJason;
  String? _zoneArea;
  String? _inchargeLevelOne;
  dynamic _inchargeLevelTwo;
  dynamic _inchargeLevelThree;
  Dealer copyWith({
    String? id,
    String? catId,
    String? firstName,
    String? lastName,
    String? address1,
    String? address2,
    String? cityVillage,
    String? state,
    String? mobileNo,
    String? zoneId,
    String? comments,
    String? customerType,
    String? ownOther,
    String? customerOf,
    String? activeStatus,
    String? isApproved,
    dynamic approvedBy,
    dynamic approvedAt,
    dynamic aadharId,
    dynamic otherIdName,
    dynamic otherIdValue,
    String? primaryGeoJson,
    String? farmArea,
    String? centroid,
    String? fGps,
    String? lGps,
    String? createdBy,
    String? createdAt,
    dynamic updatedBy,
    String? updatedAt,
    String? zoneName,
    String? district,
    String? geoJason,
    String? zoneArea,
    String? inchargeLevelOne,
    dynamic inchargeLevelTwo,
    dynamic inchargeLevelThree,
  }) =>
      Dealer(
        id: id ?? _id,
        catId: catId ?? _catId,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        address1: address1 ?? _address1,
        address2: address2 ?? _address2,
        cityVillage: cityVillage ?? _cityVillage,
        state: state ?? _state,
        mobileNo: mobileNo ?? _mobileNo,
        zoneId: zoneId ?? _zoneId,
        comments: comments ?? _comments,
        customerType: customerType ?? _customerType,
        ownOther: ownOther ?? _ownOther,
        customerOf: customerOf ?? _customerOf,
        activeStatus: activeStatus ?? _activeStatus,
        isApproved: isApproved ?? _isApproved,
        approvedBy: approvedBy ?? _approvedBy,
        approvedAt: approvedAt ?? _approvedAt,
        aadharId: aadharId ?? _aadharId,
        otherIdName: otherIdName ?? _otherIdName,
        otherIdValue: otherIdValue ?? _otherIdValue,
        primaryGeoJson: primaryGeoJson ?? _primaryGeoJson,
        farmArea: farmArea ?? _farmArea,
        centroid: centroid ?? _centroid,
        fGps: fGps ?? _fGps,
        lGps: lGps ?? _lGps,
        createdBy: createdBy ?? _createdBy,
        createdAt: createdAt ?? _createdAt,
        updatedBy: updatedBy ?? _updatedBy,
        updatedAt: updatedAt ?? _updatedAt,
        zoneName: zoneName ?? _zoneName,
        district: district ?? _district,
        geoJason: geoJason ?? _geoJason,
        zoneArea: zoneArea ?? _zoneArea,
        inchargeLevelOne: inchargeLevelOne ?? _inchargeLevelOne,
        inchargeLevelTwo: inchargeLevelTwo ?? _inchargeLevelTwo,
        inchargeLevelThree: inchargeLevelThree ?? _inchargeLevelThree,
      );
  String? get id => _id;
  String? get catId => _catId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get cityVillage => _cityVillage;
  String? get state => _state;
  String? get mobileNo => _mobileNo;
  String? get zoneId => _zoneId;
  String? get comments => _comments;
  String? get customerType => _customerType;
  String? get ownOther => _ownOther;
  String? get customerOf => _customerOf;
  String? get activeStatus => _activeStatus;
  String? get isApproved => _isApproved;
  dynamic get approvedBy => _approvedBy;
  dynamic get approvedAt => _approvedAt;
  dynamic get aadharId => _aadharId;
  dynamic get otherIdName => _otherIdName;
  dynamic get otherIdValue => _otherIdValue;
  String? get primaryGeoJson => _primaryGeoJson;
  String? get farmArea => _farmArea;
  String? get centroid => _centroid;
  String? get fGps => _fGps;
  String? get lGps => _lGps;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  String? get zoneName => _zoneName;
  String? get district => _district;
  String? get geoJason => _geoJason;
  String? get zoneArea => _zoneArea;
  String? get inchargeLevelOne => _inchargeLevelOne;
  dynamic get inchargeLevelTwo => _inchargeLevelTwo;
  dynamic get inchargeLevelThree => _inchargeLevelThree;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['city_village'] = _cityVillage;
    map['state'] = _state;
    map['mobile_no'] = _mobileNo;
    map['zone_id'] = _zoneId;
    map['comments'] = _comments;
    map['customer_type'] = _customerType;
    map['own_other'] = _ownOther;
    map['customer_of'] = _customerOf;
    map['active_status'] = _activeStatus;
    map['is_approved'] = _isApproved;
    map['approved_by'] = _approvedBy;
    map['approved_at'] = _approvedAt;
    map['aadhar_id'] = _aadharId;
    map['other_id_name'] = _otherIdName;
    map['other_id_value'] = _otherIdValue;
    map['primary_geo_json'] = _primaryGeoJson;
    map['farm_area'] = _farmArea;
    map['centroid'] = _centroid;
    map['f_gps'] = _fGps;
    map['l_gps'] = _lGps;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['zone_name'] = _zoneName;
    map['district'] = _district;
    map['geo_jason'] = _geoJason;
    map['zone_area'] = _zoneArea;
    map['incharge_level_one'] = _inchargeLevelOne;
    map['incharge_level_two'] = _inchargeLevelTwo;
    map['incharge_level_three'] = _inchargeLevelThree;
    return map;
  }
}
