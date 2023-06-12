class BookingListModel {
  List<Data> data;
  bool status;

  BookingListModel({this.data, this.status});

  BookingListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int id;
  String customerId;
  String customerName;
  String customerMob;
  String noOfPassenger;
  String description;
  String busId;
  String seater;
  String type;
  String fromPlace;
  String toPlace;
  String fromDate;
  String toDate;
  String totalDate;
  String expectedtotalKM;
  String perKMPrice;
  String perDayPrice;
  String advanceAmountTransactionId;
  String isFullPaymentPaid;
  String isVenderAllocated;
  String isVenderAcceptedBooking;
  String bookingStatus;
  String isActive;
  String createAt;

  Data(
      {this.id,
        this.customerId,
        this.customerName,
        this.customerMob,
        this.noOfPassenger,
        this.description,
        this.busId,
        this.seater,
        this.type,
        this.fromPlace,
        this.toPlace,
        this.fromDate,
        this.toDate,
        this.totalDate,
        this.expectedtotalKM,
        this.perKMPrice,
        this.perDayPrice,
        this.advanceAmountTransactionId,
        this.isFullPaymentPaid,
        this.isVenderAllocated,
        this.isVenderAcceptedBooking,
        this.bookingStatus,
        this.isActive,
        this.createAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerMob = json['customerMob'];
    noOfPassenger = json['noOfPassenger'];
    description = json['description'];
    busId = json['busId'];
    seater = json['seater'];
    type = json['type'];
    fromPlace = json['fromPlace'];
    toPlace = json['toPlace'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    totalDate = json['totalDate'];
    expectedtotalKM = json['expectedtotalKM'];
    perKMPrice = json['perKMPrice'];
    perDayPrice = json['perDayPrice'];
    advanceAmountTransactionId = json['advanceAmountTransactionId'];
    isFullPaymentPaid = json['isFullPaymentPaid'];
    isVenderAllocated = json['isVenderAllocated'];
    isVenderAcceptedBooking = json['isVenderAcceptedBooking'];
    bookingStatus = json['bookingStatus'];
    isActive = json['isActive'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['customerMob'] = this.customerMob;
    data['noOfPassenger'] = this.noOfPassenger;
    data['description'] = this.description;
    data['busId'] = this.busId;
    data['seater'] = this.seater;
    data['type'] = this.type;
    data['fromPlace'] = this.fromPlace;
    data['toPlace'] = this.toPlace;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['totalDate'] = this.totalDate;
    data['expectedtotalKM'] = this.expectedtotalKM;
    data['perKMPrice'] = this.perKMPrice;
    data['perDayPrice'] = this.perDayPrice;
    data['advanceAmountTransactionId'] = this.advanceAmountTransactionId;
    data['isFullPaymentPaid'] = this.isFullPaymentPaid;
    data['isVenderAllocated'] = this.isVenderAllocated;
    data['isVenderAcceptedBooking'] = this.isVenderAcceptedBooking;
    data['bookingStatus'] = this.bookingStatus;
    data['isActive'] = this.isActive;
    data['createAt'] = this.createAt;
    return data;
  }
}
