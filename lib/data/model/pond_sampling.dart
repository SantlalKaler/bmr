import 'dart:convert';

PondSampling pondFromJson(String str) =>
    PondSampling.fromJson(json.decode(str));
String pondToJson(PondSampling data) => json.encode(data.toJson());

class PondSampling {
  PondSampling({
    String? id,
    String? pondId,
    String? wsa,
    String? cycleId,
    String? farmerId,
    String? farmerName,
    String? stockingDate,
  }) {
    _id = id;
    _pondId = pondId;
    _wsa = wsa;
    _cycleId = cycleId;
    _farmerId = farmerId;
    _farmerName = farmerName;
    _stockingDate = stockingDate;
  }

  PondSampling.fromJson(dynamic json) {
    _id = json['id'];
    _pondId = json['pond_id'];
    _wsa = json['wsa'];
    _cycleId = json['cycle_id'];
    _farmerId = json['farmer_id'];
    _farmerName = json['farmer_name'];
    _stockingDate = json['stocking_date'];
  }
  String? _id;
  String? _pondId;
  String? _wsa;
  String? _cycleId;
  String? _farmerId;
  String? _farmerName;
  String? _stockingDate;
  PondSampling copyWith({
    String? id,
    String? pondId,
    String? wsa,
    String? cycleId,
    String? farmerId,
    String? farmerName,
    String? stockingDate,
  }) =>
      PondSampling(
        id: id ?? _id,
        pondId: pondId ?? _pondId,
        wsa: wsa ?? _wsa,
        cycleId: cycleId ?? _cycleId,
        farmerId: farmerId ?? _farmerId,
        farmerName: farmerName ?? _farmerName,
        stockingDate: stockingDate ?? _stockingDate,
      );
  String? get id => _id;
  String? get pondId => _pondId;
  String? get wsa => _wsa;
  String? get cycleId => _cycleId;
  String? get farmerId => _farmerId;
  String? get farmerName => _farmerName;
  String? get stockingDate => _stockingDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['pond_id'] = _pondId;
    map['wsa'] = _wsa;
    map['cycle_id'] = _cycleId;
    map['farmer_id'] = _farmerId;
    map['farmer_name'] = _farmerName;
    map['stocking_date'] = _stockingDate;
    return map;
  }
}
