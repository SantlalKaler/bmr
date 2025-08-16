import 'dart:convert';

/// id : "440505"
/// task_date : "16-08-2025 07:58:52"
/// taskdate : "16-Aug-2025"
/// created_date : "16-08-2025"
/// emp_id : "1"
/// task_type : "0"
/// customer_id : "23325"
/// description : ""
/// comments : ""
/// approved_status : "0"
/// approved_date : "16-08-2025"
/// approved_by : "425"
/// checked_in : null
/// checked_out : null
/// geo_in : null
/// geo_out : null
/// status : "0"
/// last_updated : "16-08-2025"
/// form_flag : null
/// location : ""
/// geo_json : ""
/// fb_geo_json : null
/// fb_submit_time : null
/// transport : "0"
/// image : ""
/// emp_name : "admin admin"
/// firstname : "admin"
/// created_by_emp : "425"
/// sname : "admin"
/// approved_emp_name : "S Praveen K"
/// created_emp_name : " Ramanaiah Buchimgari"
/// customername : "*\"Veeravasaram"
/// region_id : "4,1,2,3,5,7,9,12"

Task taskFromJson(String str) => Task.fromJson(json.decode(str));
String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    String? id,
    String? taskDate,
    String? taskdate,
    String? createdDate,
    String? empId,
    String? taskType,
    String? customerId,
    String? description,
    String? comments,
    String? approvedStatus,
    String? approvedDate,
    String? approvedBy,
    dynamic checkedIn,
    dynamic checkedOut,
    dynamic geoIn,
    dynamic geoOut,
    String? status,
    String? lastUpdated,
    dynamic formFlag,
    String? location,
    String? geoJson,
    dynamic fbGeoJson,
    dynamic fbSubmitTime,
    String? transport,
    String? image,
    String? empName,
    String? firstname,
    String? createdByEmp,
    String? sname,
    String? approvedEmpName,
    String? createdEmpName,
    String? customername,
    String? regionId,
  }) {
    _id = id;
    _taskDate = taskDate;
    _taskdate = taskdate;
    _createdDate = createdDate;
    _empId = empId;
    _taskType = taskType;
    _customerId = customerId;
    _description = description;
    _comments = comments;
    _approvedStatus = approvedStatus;
    _approvedDate = approvedDate;
    _approvedBy = approvedBy;
    _checkedIn = checkedIn;
    _checkedOut = checkedOut;
    _geoIn = geoIn;
    _geoOut = geoOut;
    _status = status;
    _lastUpdated = lastUpdated;
    _formFlag = formFlag;
    _location = location;
    _geoJson = geoJson;
    _fbGeoJson = fbGeoJson;
    _fbSubmitTime = fbSubmitTime;
    _transport = transport;
    _image = image;
    _empName = empName;
    _firstname = firstname;
    _createdByEmp = createdByEmp;
    _sname = sname;
    _approvedEmpName = approvedEmpName;
    _createdEmpName = createdEmpName;
    _customername = customername;
    _regionId = regionId;
  }

  Task.fromJson(dynamic json) {
    _id = json['id'];
    _taskDate = json['task_date'];
    _taskdate = json['taskdate'];
    _createdDate = json['created_date'];
    _empId = json['emp_id'];
    _taskType = json['task_type'];
    _customerId = json['customer_id'];
    _description = json['description'];
    _comments = json['comments'];
    _approvedStatus = json['approved_status'];
    _approvedDate = json['approved_date'];
    _approvedBy = json['approved_by'];
    _checkedIn = json['checked_in'];
    _checkedOut = json['checked_out'];
    _geoIn = json['geo_in'];
    _geoOut = json['geo_out'];
    _status = json['status'];
    _lastUpdated = json['last_updated'];
    _formFlag = json['form_flag'];
    _location = json['location'];
    _geoJson = json['geo_json'];
    _fbGeoJson = json['fb_geo_json'];
    _fbSubmitTime = json['fb_submit_time'];
    _transport = json['transport'];
    _image = json['image'];
    _empName = json['emp_name'];
    _firstname = json['firstname'];
    _createdByEmp = json['created_by_emp'];
    _sname = json['sname'];
    _approvedEmpName = json['approved_emp_name'];
    _createdEmpName = json['created_emp_name'];
    _customername = json['customername'];
    _regionId = json['region_id'];
  }
  String? _id;
  String? _taskDate;
  String? _taskdate;
  String? _createdDate;
  String? _empId;
  String? _taskType;
  String? _customerId;
  String? _description;
  String? _comments;
  String? _approvedStatus;
  String? _approvedDate;
  String? _approvedBy;
  dynamic _checkedIn;
  dynamic _checkedOut;
  dynamic _geoIn;
  dynamic _geoOut;
  String? _status;
  String? _lastUpdated;
  dynamic _formFlag;
  String? _location;
  String? _geoJson;
  dynamic _fbGeoJson;
  dynamic _fbSubmitTime;
  String? _transport;
  String? _image;
  String? _empName;
  String? _firstname;
  String? _createdByEmp;
  String? _sname;
  String? _approvedEmpName;
  String? _createdEmpName;
  String? _customername;
  String? _regionId;
  Task copyWith({
    String? id,
    String? taskDate,
    String? taskdate,
    String? createdDate,
    String? empId,
    String? taskType,
    String? customerId,
    String? description,
    String? comments,
    String? approvedStatus,
    String? approvedDate,
    String? approvedBy,
    dynamic checkedIn,
    dynamic checkedOut,
    dynamic geoIn,
    dynamic geoOut,
    String? status,
    String? lastUpdated,
    dynamic formFlag,
    String? location,
    String? geoJson,
    dynamic fbGeoJson,
    dynamic fbSubmitTime,
    String? transport,
    String? image,
    String? empName,
    String? firstname,
    String? createdByEmp,
    String? sname,
    String? approvedEmpName,
    String? createdEmpName,
    String? customername,
    String? regionId,
  }) =>
      Task(
        id: id ?? _id,
        taskDate: taskDate ?? _taskDate,
        taskdate: taskdate ?? _taskdate,
        createdDate: createdDate ?? _createdDate,
        empId: empId ?? _empId,
        taskType: taskType ?? _taskType,
        customerId: customerId ?? _customerId,
        description: description ?? _description,
        comments: comments ?? _comments,
        approvedStatus: approvedStatus ?? _approvedStatus,
        approvedDate: approvedDate ?? _approvedDate,
        approvedBy: approvedBy ?? _approvedBy,
        checkedIn: checkedIn ?? _checkedIn,
        checkedOut: checkedOut ?? _checkedOut,
        geoIn: geoIn ?? _geoIn,
        geoOut: geoOut ?? _geoOut,
        status: status ?? _status,
        lastUpdated: lastUpdated ?? _lastUpdated,
        formFlag: formFlag ?? _formFlag,
        location: location ?? _location,
        geoJson: geoJson ?? _geoJson,
        fbGeoJson: fbGeoJson ?? _fbGeoJson,
        fbSubmitTime: fbSubmitTime ?? _fbSubmitTime,
        transport: transport ?? _transport,
        image: image ?? _image,
        empName: empName ?? _empName,
        firstname: firstname ?? _firstname,
        createdByEmp: createdByEmp ?? _createdByEmp,
        sname: sname ?? _sname,
        approvedEmpName: approvedEmpName ?? _approvedEmpName,
        createdEmpName: createdEmpName ?? _createdEmpName,
        customername: customername ?? _customername,
        regionId: regionId ?? _regionId,
      );
  String? get id => _id;
  String? get taskDate => _taskDate;
  String? get taskdate => _taskdate;
  String? get createdDate => _createdDate;
  String? get empId => _empId;
  String? get taskType => _taskType;
  String? get customerId => _customerId;
  String? get description => _description;
  String? get comments => _comments;
  String? get approvedStatus => _approvedStatus;
  String? get approvedDate => _approvedDate;
  String? get approvedBy => _approvedBy;
  dynamic get checkedIn => _checkedIn;
  dynamic get checkedOut => _checkedOut;
  dynamic get geoIn => _geoIn;
  dynamic get geoOut => _geoOut;
  String? get status => _status;
  String? get lastUpdated => _lastUpdated;
  dynamic get formFlag => _formFlag;
  String? get location => _location;
  String? get geoJson => _geoJson;
  dynamic get fbGeoJson => _fbGeoJson;
  dynamic get fbSubmitTime => _fbSubmitTime;
  String? get transport => _transport;
  String? get image => _image;
  String? get empName => _empName;
  String? get firstname => _firstname;
  String? get createdByEmp => _createdByEmp;
  String? get sname => _sname;
  String? get approvedEmpName => _approvedEmpName;
  String? get createdEmpName => _createdEmpName;
  String? get customername => _customername;
  String? get regionId => _regionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['task_date'] = _taskDate;
    map['taskdate'] = _taskdate;
    map['created_date'] = _createdDate;
    map['emp_id'] = _empId;
    map['task_type'] = _taskType;
    map['customer_id'] = _customerId;
    map['description'] = _description;
    map['comments'] = _comments;
    map['approved_status'] = _approvedStatus;
    map['approved_date'] = _approvedDate;
    map['approved_by'] = _approvedBy;
    map['checked_in'] = _checkedIn;
    map['checked_out'] = _checkedOut;
    map['geo_in'] = _geoIn;
    map['geo_out'] = _geoOut;
    map['status'] = _status;
    map['last_updated'] = _lastUpdated;
    map['form_flag'] = _formFlag;
    map['location'] = _location;
    map['geo_json'] = _geoJson;
    map['fb_geo_json'] = _fbGeoJson;
    map['fb_submit_time'] = _fbSubmitTime;
    map['transport'] = _transport;
    map['image'] = _image;
    map['emp_name'] = _empName;
    map['firstname'] = _firstname;
    map['created_by_emp'] = _createdByEmp;
    map['sname'] = _sname;
    map['approved_emp_name'] = _approvedEmpName;
    map['created_emp_name'] = _createdEmpName;
    map['customername'] = _customername;
    map['region_id'] = _regionId;
    return map;
  }
}
