import 'dart:async';


import 'package:car_rental/api/apis.dart';
import 'package:car_rental/models/buses_list_model.dart';
import 'package:car_rental/utilities/common.dart';

import 'package:get/get.dart';





class HomeScreenController extends GetxController {

  BusesListModel loginScreenResponse;


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




  Future<BusesListModel> getData() async {
    toggleLoading();
    final response = await Apis().Buses();

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
