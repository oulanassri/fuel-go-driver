class ActiveOrder {
  String? date;
  String? orderNumber;
  String? lat;
  String? long;
  String? locationDescription;
  String? neighborhoodId;
  String? fuelTypeId;
  String? orderedQuantity;
  String? customerCarId;

  ActiveOrder(
      {this.date,
        this.orderNumber,
        this.lat,
        this.long,
        this.locationDescription,
        this.neighborhoodId,
        this.fuelTypeId,
        this.orderedQuantity,
        this.customerCarId});

  ActiveOrder.fromJson(Map<String, dynamic> json) {
    date = json['date'].toString()??"";
    orderNumber = json['orderNumber'].toString()??"";
    lat = json['lat'].toString()??"";
    long = json['long'].toString()??"";
    locationDescription = json['locationDescription'].toString()??"";
    neighborhoodId = json['neighborhoodId'].toString()??"";
    fuelTypeId = json['fuelTypeId'].toString()??"";
    orderedQuantity = json['orderedQuantity'].toString()??"";
    customerCarId = json['customerCarId'].toString()??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['orderNumber'] = this.orderNumber;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['locationDescription'] = this.locationDescription;
    data['neighborhoodId'] = this.neighborhoodId;
    data['fuelTypeId'] = this.fuelTypeId;
    data['orderedQuantity'] = this.orderedQuantity;
    data['customerCarId'] = this.customerCarId;
    return data;
  }
}
