

class BusesListModel {
  List<Buses> buses;
  bool status;

  BusesListModel({this.buses, this.status});

  BusesListModel.fromJson(Map<String, dynamic> json) {
    if (json['buses'] != null) {
      buses = new List<Buses>();
      json['buses'].forEach((v) {
        buses.add(new Buses.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.buses != null) {
      data['buses'] = this.buses.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Buses {
  int id;
  String busName;
  String busDetails;
  String seater;
  String type;
  String perExtraDayChange;
  String perKMPriceInCity;
  String perKMPriceOutOfCity;
  String photo;
  String isActive;
  String createAt;


  Buses(
      {this.id,
        this.busName,
        this.busDetails,
        this.seater,
        this.type,
        this.perExtraDayChange,
        this.perKMPriceInCity,
        this.perKMPriceOutOfCity,
        this.photo,
        this.isActive,
        this.createAt,
     });

  Buses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    busName = json['busName'];
    busDetails = json['busDetails'];
    seater = json['seater'];
    type = json['type'];
    perExtraDayChange = json['perExtraDayChange'];
    perKMPriceInCity = json['perKMPriceInCity'];
    perKMPriceOutOfCity = json['perKMPriceOutOfCity'];
    photo = json['photo'];
    isActive = json['isActive'];
    createAt = json['createAt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['busName'] = this.busName;
    data['busDetails'] = this.busDetails;
    data['seater'] = this.seater;
    data['type'] = this.type;
    data['perExtraDayChange'] = this.perExtraDayChange;
    data['perKMPriceInCity'] = this.perKMPriceInCity;
    data['perKMPriceOutOfCity'] = this.perKMPriceOutOfCity;
    data['photo'] = this.photo;
    data['isActive'] = this.isActive;
    data['createAt'] = this.createAt;

    return data;
  }
}