import 'dart:async';

import 'package:car_rental/api/apis.dart';
import 'package:car_rental/models/LoginModel.dart';
import 'package:car_rental/preferences/pref_repository.dart';
import 'package:car_rental/showroom.dart';
import 'package:car_rental/utilities/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class LoginScreenController extends GetxController {

   LoginModel loginScreenResponse;

  bool loading = false;
  TextEditingController emailtxtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final pref = PrefRepository();


  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }




  Future<LoginModel> VerifyLogin() async {
    toggleLoading();
    final response = await Apis().Login(emailtxtController.text);

    printLog(response);

    if (response != null) {
      loginScreenResponse = response;
    //  pref.clearPreferences();
      pref.saveLoginData(loginScreenResponse);

      if(loginScreenResponse.status) {
        Get.offAll(Showroom());
        showSnackbar('Login Success');
      }
      else{
        showSnackbar('Login Fail');

      }
    }
    else{
      if (response != null)
      showSnackbar('Login Fail');

    }

    toggleLoading();
    update();
    return loginScreenResponse;
  }



}
