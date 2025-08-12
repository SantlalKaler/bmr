import 'dart:convert';

/// id : "357"
/// firstname : "Maradana"
/// lastname : "Adinarayana"
/// category_id : "4"
/// contactno : "7995580809"
/// email : "adi.mardana@gmail.com"
/// employee_no : "FP620"
/// address1 : "Tanguturu"
/// username : "7995580809"
/// password : "MTIzNDU="
/// region_id : "1"
/// emp_dep : "1"
/// reporting_to : "59"
/// image : ""
/// casual_leave : null
/// sick_leave : null
/// privilege_leave : null
/// status : "1"
/// department_name : "Sales & Marketing"
/// category_name : "Executive"

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));
String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  Employee({
    String? id,
    String? firstname,
    String? lastname,
    String? categoryId,
    String? contactno,
    String? email,
    String? employeeNo,
    String? address1,
    String? username,
    String? password,
    String? regionId,
    String? empDep,
    String? reportingTo,
    String? image,
    dynamic casualLeave,
    dynamic sickLeave,
    dynamic privilegeLeave,
    String? status,
    String? departmentName,
    String? categoryName,
  }) {
    _id = id;
    _firstname = firstname;
    _lastname = lastname;
    _categoryId = categoryId;
    _contactno = contactno;
    _email = email;
    _employeeNo = employeeNo;
    _address1 = address1;
    _username = username;
    _password = password;
    _regionId = regionId;
    _empDep = empDep;
    _reportingTo = reportingTo;
    _image = image;
    _casualLeave = casualLeave;
    _sickLeave = sickLeave;
    _privilegeLeave = privilegeLeave;
    _status = status;
    _departmentName = departmentName;
    _categoryName = categoryName;
  }

  Employee.fromJson(dynamic json) {
    _id = json['id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _categoryId = json['category_id'];
    _contactno = json['contactno'];
    _email = json['email'];
    _employeeNo = json['employee_no'];
    _address1 = json['address1'];
    _username = json['username'];
    _password = json['password'];
    _regionId = json['region_id'];
    _empDep = json['emp_dep'];
    _reportingTo = json['reporting_to'];
    _image = json['image'];
    _casualLeave = json['casual_leave'];
    _sickLeave = json['sick_leave'];
    _privilegeLeave = json['privilege_leave'];
    _status = json['status'];
    _departmentName = json['department_name'];
    _categoryName = json['category_name'];
  }
  String? _id;
  String? _firstname;
  String? _lastname;
  String? _categoryId;
  String? _contactno;
  String? _email;
  String? _employeeNo;
  String? _address1;
  String? _username;
  String? _password;
  String? _regionId;
  String? _empDep;
  String? _reportingTo;
  String? _image;
  dynamic _casualLeave;
  dynamic _sickLeave;
  dynamic _privilegeLeave;
  String? _status;
  String? _departmentName;
  String? _categoryName;
  Employee copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? categoryId,
    String? contactno,
    String? email,
    String? employeeNo,
    String? address1,
    String? username,
    String? password,
    String? regionId,
    String? empDep,
    String? reportingTo,
    String? image,
    dynamic casualLeave,
    dynamic sickLeave,
    dynamic privilegeLeave,
    String? status,
    String? departmentName,
    String? categoryName,
  }) =>
      Employee(
        id: id ?? _id,
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        categoryId: categoryId ?? _categoryId,
        contactno: contactno ?? _contactno,
        email: email ?? _email,
        employeeNo: employeeNo ?? _employeeNo,
        address1: address1 ?? _address1,
        username: username ?? _username,
        password: password ?? _password,
        regionId: regionId ?? _regionId,
        empDep: empDep ?? _empDep,
        reportingTo: reportingTo ?? _reportingTo,
        image: image ?? _image,
        casualLeave: casualLeave ?? _casualLeave,
        sickLeave: sickLeave ?? _sickLeave,
        privilegeLeave: privilegeLeave ?? _privilegeLeave,
        status: status ?? _status,
        departmentName: departmentName ?? _departmentName,
        categoryName: categoryName ?? _categoryName,
      );
  String? get id => _id;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get categoryId => _categoryId;
  String? get contactno => _contactno;
  String? get email => _email;
  String? get employeeNo => _employeeNo;
  String? get address1 => _address1;
  String? get username => _username;
  String? get password => _password;
  String? get regionId => _regionId;
  String? get empDep => _empDep;
  String? get reportingTo => _reportingTo;
  String? get image => _image;
  dynamic get casualLeave => _casualLeave;
  dynamic get sickLeave => _sickLeave;
  dynamic get privilegeLeave => _privilegeLeave;
  String? get status => _status;
  String? get departmentName => _departmentName;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['category_id'] = _categoryId;
    map['contactno'] = _contactno;
    map['email'] = _email;
    map['employee_no'] = _employeeNo;
    map['address1'] = _address1;
    map['username'] = _username;
    map['password'] = _password;
    map['region_id'] = _regionId;
    map['emp_dep'] = _empDep;
    map['reporting_to'] = _reportingTo;
    map['image'] = _image;
    map['casual_leave'] = _casualLeave;
    map['sick_leave'] = _sickLeave;
    map['privilege_leave'] = _privilegeLeave;
    map['status'] = _status;
    map['department_name'] = _departmentName;
    map['category_name'] = _categoryName;
    return map;
  }
}
