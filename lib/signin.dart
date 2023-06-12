
import 'package:car_rental/controllers/login_screen_controller.dart';
import 'package:car_rental/utilities/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'utilities/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final loginCtrl = Get.put(LoginScreenController());
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Color.fromRGBO(65, 64, 66, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        fontFamily: 'Nunito Sans'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width/8,
                  ),
                  new TextFormField(
                    controller: loginCtrl.emailtxtController,
                    keyboardType: TextInputType.number ,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return errorField;
                      }
                      else if(value.length<10){
                        return errorField;
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontFamily: 'Nunito Sans'),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Mobile Number',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        errorBorder: customerrorBorder),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width/4,
                  ),

                  GetBuilder<LoginScreenController>(builder: (_) {
                    return loginCtrl.loading == true
                        ? const ProgressBarWidget()
                        : SizedBox(
                            height: 62,
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {
                                if (_formkey.currentState.validate()) {

                                  loginCtrl.VerifyLogin();
                                /*  loginCtrl.VerifyLogin(
                                      loginCtrl.emailtxtController.text,
                                      loginCtrl.passwordController.text);*/
                                }
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              ),
                              color: Color.fromRGBO(105, 38, 215, 0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(14.0), // <-- Radius
                              ),
                            ));
                  }),

                  SizedBox(
                    height: 25,
                  ),

                ],
              )),
        ),
      )
    ])));
  }
}
