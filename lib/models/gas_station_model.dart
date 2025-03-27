class GasStationModel {
  String? id;//
  String? neighborhoodId;//
  String? name;
  String? lat;//
  String? long;//
  String? locationDescription;
  String? neighborhood;//
  String? truckTankRefills;//

  GasStationModel(
      {this.id,
        this.neighborhoodId,
        this.name,
        this.lat,
        this.long,
        this.locationDescription,
        this.neighborhood,
        this.truckTankRefills});

  GasStationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    neighborhoodId = json['neighborhoodId'].toString();
    name = json['name'].toString();
    lat = json['lat'].toString();
    long = json['long'].toString();
    locationDescription = json['locationDescription'].toString();
    neighborhood = json['neighborhood'].toString();
    truckTankRefills = json['truckTankRefills'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['neighborhoodId'] = this.neighborhoodId;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['locationDescription'] = this.locationDescription;
    data['neighborhood'] = this.neighborhood;
    data['truckTankRefills'] = this.truckTankRefills;
    return data;
  }
}
