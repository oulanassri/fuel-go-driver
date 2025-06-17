class CompleteOrderResponse {
  String? date;
  String? orderNumber;
  String? locationDescription;
  Null? neighborhoodName;
  Null? fuelTypeName;
  int? orderedQuantity;
  int? price;
  int? finalQuantity;
  int? finalPrice;
  Null? customerCarBrand;
  String? customerApartmentName;
  String? authCode;
  String? statusName;
  String? customerName;
  String? customerPhone;
  String? driverName;
  String? driverPhone;
  Null? deliveryFee;

  CompleteOrderResponse(
      {this.date,
        this.orderNumber,
        this.locationDescription,
        this.neighborhoodName,
        this.fuelTypeName,
        this.orderedQuantity,
        this.price,
        this.finalQuantity,
        this.finalPrice,
        this.customerCarBrand,
        this.customerApartmentName,
        this.authCode,
        this.statusName,
        this.customerName,
        this.customerPhone,
        this.driverName,
        this.driverPhone,
        this.deliveryFee});

  CompleteOrderResponse.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    orderNumber = json['orderNumber'];
    locationDescription = json['locationDescription'];
    neighborhoodName = json['neighborhoodName'];
    fuelTypeName = json['fuelTypeName'];
    orderedQuantity = json['orderedQuantity'];
    price = json['price'];
    finalQuantity = json['finalQuantity'];
    finalPrice = json['finalPrice'];
    customerCarBrand = json['customerCarBrand'];
    customerApartmentName = json['customerApartmentName'];
    authCode = json['authCode'];
    statusName = json['statusName'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    driverName = json['driverName'];
    driverPhone = json['driverPhone'];
    deliveryFee = json['deliveryFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['orderNumber'] = this.orderNumber;
    data['locationDescription'] = this.locationDescription;
    data['neighborhoodName'] = this.neighborhoodName;
    data['fuelTypeName'] = this.fuelTypeName;
    data['orderedQuantity'] = this.orderedQuantity;
    data['price'] = this.price;
    data['finalQuantity'] = this.finalQuantity;
    data['finalPrice'] = this.finalPrice;
    data['customerCarBrand'] = this.customerCarBrand;
    data['customerApartmentName'] = this.customerApartmentName;
    data['authCode'] = this.authCode;
    data['statusName'] = this.statusName;
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['driverName'] = this.driverName;
    data['driverPhone'] = this.driverPhone;
    data['deliveryFee'] = this.deliveryFee;
    return data;
  }
}
