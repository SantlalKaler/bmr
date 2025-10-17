import 'dart:convert';

/// cycle_id : "3460"
/// culture_seed_date : "2025-10-05 02:12:28"
/// doc : null
/// stocking_date : "2025-10-05 12:00:00"
/// seed_stocking : "2"
/// success : 2
/// previous_sampling : "2025-10-05"

ActiveCycle activeCycleFromJson(String str) =>
    ActiveCycle.fromJson(json.decode(str));
String activeCycleToJson(ActiveCycle data) => json.encode(data.toJson());

class ActiveCycle {
  ActiveCycle({
    String? cycleId,
    String? cultureSeedDate,
    dynamic doc,
    String? stockingDate,
    String? seedStocking,
    num? success,
    String? previousSampling,
  }) {
    _cycleId = cycleId;
    _cultureSeedDate = cultureSeedDate;
    _doc = doc;
    _stockingDate = stockingDate;
    _seedStocking = seedStocking;
    _success = success;
    _previousSampling = previousSampling;
  }

  ActiveCycle.fromJson(dynamic json) {
    _cycleId = json['cycle_id'];
    _cultureSeedDate = json['culture_seed_date'];
    _doc = json['doc'];
    _stockingDate = json['stocking_date'];
    _seedStocking = json['seed_stocking'];
    _success = json['success'];
    _previousSampling = json['previous_sampling'];
  }
  String? _cycleId;
  String? _cultureSeedDate;
  dynamic _doc;
  String? _stockingDate;
  String? _seedStocking;
  num? _success;
  String? _previousSampling;
  ActiveCycle copyWith({
    String? cycleId,
    String? cultureSeedDate,
    dynamic doc,
    String? stockingDate,
    String? seedStocking,
    num? success,
    String? previousSampling,
  }) =>
      ActiveCycle(
        cycleId: cycleId ?? _cycleId,
        cultureSeedDate: cultureSeedDate ?? _cultureSeedDate,
        doc: doc ?? _doc,
        stockingDate: stockingDate ?? _stockingDate,
        seedStocking: seedStocking ?? _seedStocking,
        success: success ?? _success,
        previousSampling: previousSampling ?? _previousSampling,
      );
  String? get cycleId => _cycleId;
  String? get cultureSeedDate => _cultureSeedDate;
  dynamic get doc => _doc;
  String? get stockingDate => _stockingDate;
  String? get seedStocking => _seedStocking;
  num? get success => _success;
  String? get previousSampling => _previousSampling;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cycle_id'] = _cycleId;
    map['culture_seed_date'] = _cultureSeedDate;
    map['doc'] = _doc;
    map['stocking_date'] = _stockingDate;
    map['seed_stocking'] = _seedStocking;
    map['success'] = _success;
    map['previous_sampling'] = _previousSampling;
    return map;
  }
}
