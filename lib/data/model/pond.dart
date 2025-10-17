import 'dart:convert';

/// id : "3460"
/// seed_stocking : "2"
/// stocking_date : "2025-10-05 12:00:00"
/// farmer_id : "29073"
/// pond_id : "Pond_a1"
/// recorded_date : "2025-10-05 14:12:28"
/// emp_id : "579"
/// cycle_status : "0"
/// doc : null
/// culture_seed_date : "2025-10-05 02:12:28"
/// cycle_id : "3460"
/// farmer_name : "Akhil Yadlapalli"
/// comments : "Testp1"
/// density : "809400"
/// last_cycle_id : null
/// wsa : "200"
/// status : "0"
/// pondid : "5601"

Pond pondFromJson(String str) => Pond.fromJson(json.decode(str));
String pondToJson(Pond data) => json.encode(data.toJson());

class Pond {
  Pond({
    String? id,
    String? seedStocking,
    String? stockingDate,
    String? farmerId,
    String? pondId,
    String? recordedDate,
    String? empId,
    String? cycleStatus,
    dynamic doc,
    String? cultureSeedDate,
    String? cycleId,
    String? farmerName,
    String? comments,
    String? density,
    dynamic lastCycleId,
    String? wsa,
    String? status,
    String? pondid,
  }) {
    _id = id;
    _seedStocking = seedStocking;
    _stockingDate = stockingDate;
    _farmerId = farmerId;
    _pondId = pondId;
    _recordedDate = recordedDate;
    _empId = empId;
    _cycleStatus = cycleStatus;
    _doc = doc;
    _cultureSeedDate = cultureSeedDate;
    _cycleId = cycleId;
    _farmerName = farmerName;
    _comments = comments;
    _density = density;
    _lastCycleId = lastCycleId;
    _wsa = wsa;
    _status = status;
    _pondid = pondid;
  }

  Pond.fromJson(dynamic json) {
    _id = json['id'];
    _seedStocking = json['seed_stocking'];
    _stockingDate = json['stocking_date'];
    _farmerId = json['farmer_id'];
    _pondId = json['pond_id'];
    _recordedDate = json['recorded_date'];
    _empId = json['emp_id'];
    _cycleStatus = json['cycle_status'];
    _doc = json['doc'];
    _cultureSeedDate = json['culture_seed_date'];
    _cycleId = json['cycle_id'];
    _farmerName = json['farmer_name'];
    _comments = json['comments'];
    _density = json['density'];
    _lastCycleId = json['last_cycle_id'];
    _wsa = json['wsa'];
    _status = json['status'];
    _pondid = json['pondid'];
  }
  String? _id;
  String? _seedStocking;
  String? _stockingDate;
  String? _farmerId;
  String? _pondId;
  String? _recordedDate;
  String? _empId;
  String? _cycleStatus;
  dynamic _doc;
  String? _cultureSeedDate;
  String? _cycleId;
  String? _farmerName;
  String? _comments;
  String? _density;
  dynamic _lastCycleId;
  String? _wsa;
  String? _status;
  String? _pondid;
  Pond copyWith({
    String? id,
    String? seedStocking,
    String? stockingDate,
    String? farmerId,
    String? pondId,
    String? recordedDate,
    String? empId,
    String? cycleStatus,
    dynamic doc,
    String? cultureSeedDate,
    String? cycleId,
    String? farmerName,
    String? comments,
    String? density,
    dynamic lastCycleId,
    String? wsa,
    String? status,
    String? pondid,
  }) =>
      Pond(
        id: id ?? _id,
        seedStocking: seedStocking ?? _seedStocking,
        stockingDate: stockingDate ?? _stockingDate,
        farmerId: farmerId ?? _farmerId,
        pondId: pondId ?? _pondId,
        recordedDate: recordedDate ?? _recordedDate,
        empId: empId ?? _empId,
        cycleStatus: cycleStatus ?? _cycleStatus,
        doc: doc ?? _doc,
        cultureSeedDate: cultureSeedDate ?? _cultureSeedDate,
        cycleId: cycleId ?? _cycleId,
        farmerName: farmerName ?? _farmerName,
        comments: comments ?? _comments,
        density: density ?? _density,
        lastCycleId: lastCycleId ?? _lastCycleId,
        wsa: wsa ?? _wsa,
        status: status ?? _status,
        pondid: pondid ?? _pondid,
      );
  String? get id => _id;
  String? get seedStocking => _seedStocking;
  String? get stockingDate => _stockingDate;
  String? get farmerId => _farmerId;
  String? get pondId => _pondId;
  String? get recordedDate => _recordedDate;
  String? get empId => _empId;
  String? get cycleStatus => _cycleStatus;
  dynamic get doc => _doc;
  String? get cultureSeedDate => _cultureSeedDate;
  String? get cycleId => _cycleId;
  String? get farmerName => _farmerName;
  String? get comments => _comments;
  String? get density => _density;
  dynamic get lastCycleId => _lastCycleId;
  String? get wsa => _wsa;
  String? get status => _status;
  String? get pondid => _pondid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['seed_stocking'] = _seedStocking;
    map['stocking_date'] = _stockingDate;
    map['farmer_id'] = _farmerId;
    map['pond_id'] = _pondId;
    map['recorded_date'] = _recordedDate;
    map['emp_id'] = _empId;
    map['cycle_status'] = _cycleStatus;
    map['doc'] = _doc;
    map['culture_seed_date'] = _cultureSeedDate;
    map['cycle_id'] = _cycleId;
    map['farmer_name'] = _farmerName;
    map['comments'] = _comments;
    map['density'] = _density;
    map['last_cycle_id'] = _lastCycleId;
    map['wsa'] = _wsa;
    map['status'] = _status;
    map['pondid'] = _pondid;
    return map;
  }
}
