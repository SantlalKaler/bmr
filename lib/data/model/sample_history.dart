import 'dart:convert';

/// seed_stocking : "2"
/// id : "8562"
/// abw : "1000.00"
/// daily_feed : "1.00"
/// recorded_date : "2025-10-05 14:12:28"
/// emp_id : "579"
/// sample_harvest_flag : "0"
/// cycle_id : "3460"
/// sampling_date : "2025-10-05 12:00:00"
/// ph : "5"
/// salinity : "2.00"
/// survival : null
/// e_biomass : null
/// a_biomass : null
/// density : null
/// adg : "1000.00"
/// fcr : null
/// productivity : null
/// productivity_ha : null
/// harvest_quantity : null
/// task_id : "455751"
/// pond_id : "5601"
/// seed_source : null
/// acres : "0"
/// doc : "1"
/// total_feed : null
/// sampling_file : "Title (2).jpg"
/// u_emp : null

SampleHistory sampleHistoryFromJson(String str) =>
    SampleHistory.fromJson(json.decode(str));
String sampleHistoryToJson(SampleHistory data) => json.encode(data.toJson());

class SampleHistory {
  SampleHistory({
    String? seedStocking,
    String? id,
    String? abw,
    String? dailyFeed,
    String? recordedDate,
    String? empId,
    String? sampleHarvestFlag,
    String? cycleId,
    String? samplingDate,
    String? ph,
    String? salinity,
    dynamic survival,
    dynamic eBiomass,
    dynamic aBiomass,
    dynamic density,
    String? adg,
    dynamic fcr,
    dynamic productivity,
    dynamic productivityHa,
    dynamic harvestQuantity,
    String? taskId,
    String? pondId,
    dynamic seedSource,
    String? acres,
    String? doc,
    dynamic totalFeed,
    String? samplingFile,
    dynamic uEmp,
  }) {
    _seedStocking = seedStocking;
    _id = id;
    _abw = abw;
    _dailyFeed = dailyFeed;
    _recordedDate = recordedDate;
    _empId = empId;
    _sampleHarvestFlag = sampleHarvestFlag;
    _cycleId = cycleId;
    _samplingDate = samplingDate;
    _ph = ph;
    _salinity = salinity;
    _survival = survival;
    _eBiomass = eBiomass;
    _aBiomass = aBiomass;
    _density = density;
    _adg = adg;
    _fcr = fcr;
    _productivity = productivity;
    _productivityHa = productivityHa;
    _harvestQuantity = harvestQuantity;
    _taskId = taskId;
    _pondId = pondId;
    _seedSource = seedSource;
    _acres = acres;
    _doc = doc;
    _totalFeed = totalFeed;
    _samplingFile = samplingFile;
    _uEmp = uEmp;
  }

  SampleHistory.fromJson(dynamic json) {
    _seedStocking = json['seed_stocking'];
    _id = json['id'];
    _abw = json['abw'];
    _dailyFeed = json['daily_feed'];
    _recordedDate = json['recorded_date'];
    _empId = json['emp_id'];
    _sampleHarvestFlag = json['sample_harvest_flag'];
    _cycleId = json['cycle_id'];
    _samplingDate = json['sampling_date'];
    _ph = json['ph'];
    _salinity = json['salinity'];
    _survival = json['survival'];
    _eBiomass = json['e_biomass'];
    _aBiomass = json['a_biomass'];
    _density = json['density'];
    _adg = json['adg'];
    _fcr = json['fcr'];
    _productivity = json['productivity'];
    _productivityHa = json['productivity_ha'];
    _harvestQuantity = json['harvest_quantity'];
    _taskId = json['task_id'];
    _pondId = json['pond_id'];
    _seedSource = json['seed_source'];
    _acres = json['acres'];
    _doc = json['doc'];
    _totalFeed = json['total_feed'];
    _samplingFile = json['sampling_file'];
    _uEmp = json['u_emp'];
  }
  String? _seedStocking;
  String? _id;
  String? _abw;
  String? _dailyFeed;
  String? _recordedDate;
  String? _empId;
  String? _sampleHarvestFlag;
  String? _cycleId;
  String? _samplingDate;
  String? _ph;
  String? _salinity;
  dynamic _survival;
  dynamic _eBiomass;
  dynamic _aBiomass;
  dynamic _density;
  String? _adg;
  dynamic _fcr;
  dynamic _productivity;
  dynamic _productivityHa;
  dynamic _harvestQuantity;
  String? _taskId;
  String? _pondId;
  dynamic _seedSource;
  String? _acres;
  String? _doc;
  dynamic _totalFeed;
  String? _samplingFile;
  dynamic _uEmp;
  SampleHistory copyWith({
    String? seedStocking,
    String? id,
    String? abw,
    String? dailyFeed,
    String? recordedDate,
    String? empId,
    String? sampleHarvestFlag,
    String? cycleId,
    String? samplingDate,
    String? ph,
    String? salinity,
    dynamic survival,
    dynamic eBiomass,
    dynamic aBiomass,
    dynamic density,
    String? adg,
    dynamic fcr,
    dynamic productivity,
    dynamic productivityHa,
    dynamic harvestQuantity,
    String? taskId,
    String? pondId,
    dynamic seedSource,
    String? acres,
    String? doc,
    dynamic totalFeed,
    String? samplingFile,
    dynamic uEmp,
  }) =>
      SampleHistory(
        seedStocking: seedStocking ?? _seedStocking,
        id: id ?? _id,
        abw: abw ?? _abw,
        dailyFeed: dailyFeed ?? _dailyFeed,
        recordedDate: recordedDate ?? _recordedDate,
        empId: empId ?? _empId,
        sampleHarvestFlag: sampleHarvestFlag ?? _sampleHarvestFlag,
        cycleId: cycleId ?? _cycleId,
        samplingDate: samplingDate ?? _samplingDate,
        ph: ph ?? _ph,
        salinity: salinity ?? _salinity,
        survival: survival ?? _survival,
        eBiomass: eBiomass ?? _eBiomass,
        aBiomass: aBiomass ?? _aBiomass,
        density: density ?? _density,
        adg: adg ?? _adg,
        fcr: fcr ?? _fcr,
        productivity: productivity ?? _productivity,
        productivityHa: productivityHa ?? _productivityHa,
        harvestQuantity: harvestQuantity ?? _harvestQuantity,
        taskId: taskId ?? _taskId,
        pondId: pondId ?? _pondId,
        seedSource: seedSource ?? _seedSource,
        acres: acres ?? _acres,
        doc: doc ?? _doc,
        totalFeed: totalFeed ?? _totalFeed,
        samplingFile: samplingFile ?? _samplingFile,
        uEmp: uEmp ?? _uEmp,
      );
  String? get seedStocking => _seedStocking;
  String? get id => _id;
  String? get abw => _abw;
  String? get dailyFeed => _dailyFeed;
  String? get recordedDate => _recordedDate;
  String? get empId => _empId;
  String? get sampleHarvestFlag => _sampleHarvestFlag;
  String? get cycleId => _cycleId;
  String? get samplingDate => _samplingDate;
  String? get ph => _ph;
  String? get salinity => _salinity;
  dynamic get survival => _survival;
  dynamic get eBiomass => _eBiomass;
  dynamic get aBiomass => _aBiomass;
  dynamic get density => _density;
  String? get adg => _adg;
  dynamic get fcr => _fcr;
  dynamic get productivity => _productivity;
  dynamic get productivityHa => _productivityHa;
  dynamic get harvestQuantity => _harvestQuantity;
  String? get taskId => _taskId;
  String? get pondId => _pondId;
  dynamic get seedSource => _seedSource;
  String? get acres => _acres;
  String? get doc => _doc;
  dynamic get totalFeed => _totalFeed;
  String? get samplingFile => _samplingFile;
  dynamic get uEmp => _uEmp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seed_stocking'] = _seedStocking;
    map['id'] = _id;
    map['abw'] = _abw;
    map['daily_feed'] = _dailyFeed;
    map['recorded_date'] = _recordedDate;
    map['emp_id'] = _empId;
    map['sample_harvest_flag'] = _sampleHarvestFlag;
    map['cycle_id'] = _cycleId;
    map['sampling_date'] = _samplingDate;
    map['ph'] = _ph;
    map['salinity'] = _salinity;
    map['survival'] = _survival;
    map['e_biomass'] = _eBiomass;
    map['a_biomass'] = _aBiomass;
    map['density'] = _density;
    map['adg'] = _adg;
    map['fcr'] = _fcr;
    map['productivity'] = _productivity;
    map['productivity_ha'] = _productivityHa;
    map['harvest_quantity'] = _harvestQuantity;
    map['task_id'] = _taskId;
    map['pond_id'] = _pondId;
    map['seed_source'] = _seedSource;
    map['acres'] = _acres;
    map['doc'] = _doc;
    map['total_feed'] = _totalFeed;
    map['sampling_file'] = _samplingFile;
    map['u_emp'] = _uEmp;
    return map;
  }
}
