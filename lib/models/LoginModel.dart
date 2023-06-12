
class LoginModel {
  Customer customer;
  String message;
  bool status;

  LoginModel({this.customer, this.message, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    customer = json['Customer'] != null
        ? new Customer.fromJson(json['Customer'])
        : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['Customer'] = this.customer.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Customer {
  int id;
  String mob;
  String isActive;

  Customer({this.id, this.mob, this.isActive});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mob = json['mob'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mob'] = this.mob;
    data['isActive'] = this.isActive;
    return data;
  }
}
