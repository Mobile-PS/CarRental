import 'dart:convert';


import 'package:car_rental/api/utils.dart';
import 'package:car_rental/models/BookingListModel.dart';
import 'package:car_rental/models/BookingModel.dart';
import 'package:car_rental/models/LoginModel.dart';
import 'package:car_rental/models/buses_list_model.dart';
import 'package:car_rental/utilities/common.dart';


import 'package:http/http.dart' as http;




import 'constants.dart';

class Apis {
  final constant = ApiConstants();
  final utils = ApiUtils();




  Future<BusesListModel> Buses() async {


    final request = utils.createGetRequest(
        constant.busUrl());

   // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return BusesListModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<BookingListModel> BookingList(String params) async {


    final request = utils.createGetRequest(
        constant.bookingUrl()+'/'+params);

    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return BookingListModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<LoginModel> Login(String phonenumber) async {

    Map<String, String> params = {
      'MobileNo':phonenumber,
    };

    final request = utils.createPostRequestWithParams(
        constant.verifyLoginUrl(),params);

    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return LoginModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<BookingModel> AddBooking(Map<String,String> params) async {



    final request = utils.createPostRequestWithParams(
        constant.AddBookingUrl(),params);



    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return BookingModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }




 /* Future<AddServiceResponse> AddService(Map<String,String> params) async {



    final request = utils.createPostRequestWithParams(
        constant.addServiceUrl(),params);


    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return AddServiceResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<AddServiceResponse> UpdateService(Map<String,String> params) async {



    final request = utils.createPostRequestWithParams(
        constant.updateServiceUrl(),params);


    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return AddServiceResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<ViewServiceResponse> ViewService() async {



    final request = utils.createPostRequest(
        constant.viewServiceUrl());


    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return ViewServiceResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<DeleteServiceResponse> DeleteService(int id) async {

    Map<String, String> params = {
      constant.paramId: '$id',
    };

    final request = utils.createPostRequestWithParams(
        constant.deleteServiceUrl(),params);


    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return DeleteServiceResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }*/


}
