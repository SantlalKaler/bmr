class Customer {
  String? id;
  String? catId;
  String? firstName;
  String? lastName;
  String? address1;
  String? address2;
  String? cityVillage;
  String? state;
  String? zoneId;
  String? comments;
  String? customerType;
  String? ownOther;
  String? customerOf;
  String? activeStatus;
  String? primaryGeoJson;
  String? farmArea;
  String? catName;

  Customer({
    this.id,
    this.catId,
    this.firstName,
    this.lastName,
    this.address1,
    this.address2,
    this.cityVillage,
    this.state,
    this.zoneId,
    this.comments,
    this.customerType,
    this.ownOther,
    this.customerOf,
    this.activeStatus,
    this.primaryGeoJson,
    this.farmArea,
    this.catName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      catId: json['cat_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      address1: json['address1'],
      address2: json['address2'],
      cityVillage: json['city_village'],
      state: json['state'],
      zoneId: json['zone_id'],
      comments: json['comments'],
      customerType: json['customer_type'],
      ownOther: json['own_other'],
      customerOf: json['customer_of'],
      activeStatus: json['active_status'],
      primaryGeoJson: json['primary_geo_json'],
      farmArea: json['farm_area'],
      catName: json['cat_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cat_id': catId,
      'first_name': firstName,
      'last_name': lastName,
      'address1': address1,
      'address2': address2,
      'city_village': cityVillage,
      'state': state,
      'zone_id': zoneId,
      'comments': comments,
      'customer_type': customerType,
      'own_other': ownOther,
      'customer_of': customerOf,
      'active_status': activeStatus,
      'primary_geo_json': primaryGeoJson,
      'farm_area': farmArea,
      'cat_name': catName,
    };
  }
}
