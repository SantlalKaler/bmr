import 'dart:convert';

/// id : "4663"
/// emp_id : "579"
/// casual_leave : null
/// sick_leave : "-1"
/// privilege_leave : null
/// created_emp_name : "Urukundu KG"
/// approved_emp_name : "Urukundu KG"
/// purpose : "test sick"
/// leave_days : "1"
/// from_date : "2025-10-09"
/// to_date : "2025-10-10"
/// created_date : "2025-10-07"
/// leavetype : "Sick"
/// leave_status : "Approved"

Leave leaveFromJson(String str) => Leave.fromJson(json.decode(str));
String leaveToJson(Leave data) => json.encode(data.toJson());

class Leave {
  Leave({
    String? id,
    String? empId,
    dynamic casualLeave,
    String? sickLeave,
    dynamic privilegeLeave,
    String? createdEmpName,
    String? approvedEmpName,
    String? purpose,
    String? leaveDays,
    String? fromDate,
    String? toDate,
    String? createdDate,
    String? leavetype,
    String? leaveStatus,
  }) {
    _id = id;
    _empId = empId;
    _casualLeave = casualLeave;
    _sickLeave = sickLeave;
    _privilegeLeave = privilegeLeave;
    _createdEmpName = createdEmpName;
    _approvedEmpName = approvedEmpName;
    _purpose = purpose;
    _leaveDays = leaveDays;
    _fromDate = fromDate;
    _toDate = toDate;
    _createdDate = createdDate;
    _leavetype = leavetype;
    _leaveStatus = leaveStatus;
  }

  Leave.fromJson(dynamic json) {
    _id = json['id'];
    _empId = json['emp_id'];
    _casualLeave = json['casual_leave'];
    _sickLeave = json['sick_leave'];
    _privilegeLeave = json['privilege_leave'];
    _createdEmpName = json['created_emp_name'];
    _approvedEmpName = json['approved_emp_name'];
    _purpose = json['purpose'];
    _leaveDays = json['leave_days'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _createdDate = json['created_date'];
    _leavetype = json['leavetype'];
    _leaveStatus = json['leave_status'];
  }
  String? _id;
  String? _empId;
  dynamic _casualLeave;
  String? _sickLeave;
  dynamic _privilegeLeave;
  String? _createdEmpName;
  String? _approvedEmpName;
  String? _purpose;
  String? _leaveDays;
  String? _fromDate;
  String? _toDate;
  String? _createdDate;
  String? _leavetype;
  String? _leaveStatus;
  Leave copyWith({
    String? id,
    String? empId,
    dynamic casualLeave,
    String? sickLeave,
    dynamic privilegeLeave,
    String? createdEmpName,
    String? approvedEmpName,
    String? purpose,
    String? leaveDays,
    String? fromDate,
    String? toDate,
    String? createdDate,
    String? leavetype,
    String? leaveStatus,
  }) =>
      Leave(
        id: id ?? _id,
        empId: empId ?? _empId,
        casualLeave: casualLeave ?? _casualLeave,
        sickLeave: sickLeave ?? _sickLeave,
        privilegeLeave: privilegeLeave ?? _privilegeLeave,
        createdEmpName: createdEmpName ?? _createdEmpName,
        approvedEmpName: approvedEmpName ?? _approvedEmpName,
        purpose: purpose ?? _purpose,
        leaveDays: leaveDays ?? _leaveDays,
        fromDate: fromDate ?? _fromDate,
        toDate: toDate ?? _toDate,
        createdDate: createdDate ?? _createdDate,
        leavetype: leavetype ?? _leavetype,
        leaveStatus: leaveStatus ?? _leaveStatus,
      );
  String? get id => _id;
  String? get empId => _empId;
  dynamic get casualLeave => _casualLeave;
  String? get sickLeave => _sickLeave;
  dynamic get privilegeLeave => _privilegeLeave;
  String? get createdEmpName => _createdEmpName;
  String? get approvedEmpName => _approvedEmpName;
  String? get purpose => _purpose;
  String? get leaveDays => _leaveDays;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get createdDate => _createdDate;
  String? get leavetype => _leavetype;
  String? get leaveStatus => _leaveStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['emp_id'] = _empId;
    map['casual_leave'] = _casualLeave;
    map['sick_leave'] = _sickLeave;
    map['privilege_leave'] = _privilegeLeave;
    map['created_emp_name'] = _createdEmpName;
    map['approved_emp_name'] = _approvedEmpName;
    map['purpose'] = _purpose;
    map['leave_days'] = _leaveDays;
    map['from_date'] = _fromDate;
    map['to_date'] = _toDate;
    map['created_date'] = _createdDate;
    map['leavetype'] = _leavetype;
    map['leave_status'] = _leaveStatus;
    return map;
  }
}
