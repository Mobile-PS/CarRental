
import 'package:car_rental/api/apis.dart';
import 'package:car_rental/api/constants.dart';
import 'package:car_rental/models/BookingModel.dart';
import 'package:car_rental/preferences/pref_repository.dart';
import 'package:car_rental/showroom.dart';
import 'package:car_rental/utilities/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/buses_list_model.dart';

class BookingScreenController extends GetxController {
   BookingModel loginScreenResponse;

  bool loading = false;


  TextEditingController nametxtController = TextEditingController();
  TextEditingController mobiletxtController = TextEditingController();
  TextEditingController passagertxtController = TextEditingController();
  TextEditingController desctxtController = TextEditingController();
  TextEditingController fromtxtController = TextEditingController();
  TextEditingController totxtController = TextEditingController();


  String dob = 'Date & Time';
  String fdob = 'Date & Time';
  DateTime difftodate;
  DateTime difffromdate;
  String diff = '';

  int incity = 1;
  int outcity = 0;

  String gender;
  final _prefRepo = PrefRepository();


  final constant = ApiConstants();
  Buses car1;
  // final pref = PrefRepository();

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  void inoutcity(int pos) {

    if(pos == 1){
      incity=1;
      outcity = 0;
    }
    if(pos == 2){
      incity=0;
      outcity = 1;
    }

    update();
  }

  void carData(Buses pos) {
    car1 = pos;
  }

  void DOB(String dob, DateTime todt) {
    this.dob = dob;
    difftodate = todt;
    if(difffromdate != null){
      diff =  daysBetween(difffromdate, todt).toString();
    }
    update();
  }

  void FDOB(String dob1,DateTime ftodt) {
    this.fdob = dob1;
    difffromdate = ftodt;
    if(difftodate != null){
      diff =  daysBetween(ftodt, difftodate).toString();
    }
    update();
  }


  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

Future<BookingModel> Booking() async {
    toggleLoading();

    // http://103.14.99.198:8082/UTOSheild/BusinessRegistration?Business_Name=Govind Dairy
    // &Profession=Shop&Gender=male&Address=Burdy&City=Nagpur&State=Maharashtra&
    // Country=India&Pincode=10002&Date_of_Birth=2022-03-18&
    // Language_Known=Marathi Hindi&Mobile=9988776655&Email=govind@gmail.com&password=123&conf_password=123

    final profileResponse = await _prefRepo.getLoginUserData();


    Map<String, String> params = {
      'customerId': profileResponse.customer.id.toString(),
      'customerName' : nametxtController.text,
      'customerMob' : mobiletxtController.text,
      'noOfPassenger' : passagertxtController.text,
      'description' : desctxtController.text,
      'busId' : car1.id.toString(),
      'seater' : car1.seater,
      'type' : car1.type,
      'fromPlace' : fromtxtController.text,
      'toPlace' : totxtController.text,
      'fromDate' : fdob,
      'toDate' : dob,
      'totalDate' : diff,
      'inCityORoutOfCity' : incity == 0?'Outcity':'Incity',
      'expectedtotalKM' : '0',
      'advanceAmountTransactionId' : '0'
    };


    final response = await Apis().AddBooking(params);

    printLog(response);

    if (response != null) {
      loginScreenResponse = response;
    //  pref.clearPreferences();
     // pref.saveUserData(loginScreenResponse!.data);

      Get.offAll(Showroom());

      showSnackbar('Booking Success');
    }
    else{
      if (response != null)
      showSnackbar('Booking Fail');

    }

    toggleLoading();
    update();
    return loginScreenResponse;
  }

}
