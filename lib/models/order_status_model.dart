class OrderStatusModel {
  String? id;
  String? name;
  String? statusTypeId;

  OrderStatusModel({this.id, this.name, this.statusTypeId});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    statusTypeId = json['statusTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['statusTypeId'] = this.statusTypeId;
    return data;
  }
}
