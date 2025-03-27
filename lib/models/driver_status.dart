class DriverStatusModel {
  String? id;
  String? name;
  String? statusTypeId;

  DriverStatusModel({this.id, this.name, this.statusTypeId});

  DriverStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    statusTypeId = json['statusTypeId'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['statusTypeId'] = this.statusTypeId;
    return data;
  }
}
