import 'dart:async';


import 'package:car_rental/api/apis.dart';
import 'package:car_rental/models/BookingListModel.dart';
import 'package:car_rental/models/buses_list_model.dart';
import 'package:car_rental/preferences/pref_repository.dart';
import 'package:car_rental/utilities/common.dart';

import 'package:get/get.dart';





class BookingListScreenController extends GetxController {

  BookingListModel loginScreenResponse;

  final _prefRepo = PrefRepository();

   bool loading = false;

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }




  Future<BookingListModel> getData() async {
    toggleLoading();

    final profileResponse = await _prefRepo.getLoginUserData();



    final response = await Apis().BookingList(profileResponse.customer.id.toString());

    printLog(response);

    if (response != null) {
      loginScreenResponse = response;
    //  pref.clearPreferences();
     // pref.saveUserData(loginScreenResponse!.data);

      //showSnackbar('S');

    }
    else{
      if (response != null)
      showSnackbar('Fail');

    }

    toggleLoading();
    update();
    return loginScreenResponse;
  }



}
