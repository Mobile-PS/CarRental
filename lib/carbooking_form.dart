
import 'package:car_rental/constants.dart';
import 'package:car_rental/controllers/booking_screen_controller.dart';
import 'package:car_rental/models/buses_list_model.dart';
import 'package:car_rental/signin.dart';
import 'package:car_rental/utilities/constants.dart';
import 'package:car_rental/utilities/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'preferences/pref_repository.dart';

class BookingForm extends StatefulWidget {

  final Buses car1;
  BookingForm({@required this.car1});

  @override
  _BookingForm createState() => _BookingForm();
}

class _BookingForm extends State<BookingForm> {
  var currentSelectedValue;
  static const deviceTypes = ["India", "AUS", "USA"];
  final pref = PrefRepository();

  final regCtrl = Get.put(BookingScreenController());

  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {

      print(picked.toString());
      /* setState(() {
        selectedDate = picked;
      });*/
      regCtrl.DOB(DateFormat.yMMMd().format(picked),picked);
    }
  }


  Future<void> _fselectDate(BuildContext context) async {
    final DateTime picked1 = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked1 != null && picked1 != selectedDate1) {
      /* setState(() {
        selectedDate = picked;
      });*/
      print(picked1.toString());

      regCtrl.FDOB(DateFormat.yMMMd().format(picked1),picked1);
    }
  }



  @override
  void initState() {
    regCtrl.carData(widget.car1);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingScreenController>(builder: (_) {
      return Scaffold(
          body: Stack(children: <Widget>[
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cleaning.jpg'),
            fit: BoxFit.fill,
          ),
        )),
        SingleChildScrollView(
            child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(height: 20.0),
                    Text(
                      "Booking Form",
                      style: TextStyle(
                          color: Color.fromRGBO(65, 64, 66, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          fontFamily: 'Nunito Sans'),
                    ),
                    SizedBox(height: 8.0),
                    new TextFormField(
                      controller: regCtrl.nametxtController,
                      validator: (value) {
                        if (value.isEmpty) {
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
                        hintText: 'Name',
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
                        errorBorder: customerrorBorder
                      ),
                    ),
                    SizedBox(height: 10.0),
                    new TextFormField(
                      keyboardType: TextInputType.number ,
                      controller: regCtrl.mobiletxtController,
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
                        hintText: 'Mobile',
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
                          errorBorder: customerrorBorder

                      ),
                    ),
                    SizedBox(height: 10.0),
                    new TextFormField(
                      keyboardType: TextInputType.number ,
                      controller: regCtrl.passagertxtController,
                      validator: (value) {
                        if (value.isEmpty) {
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
                        hintText: 'Number Of passenger',
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
                          errorBorder: customerrorBorder

                      ),
                    ),
                    SizedBox(height: 10.0),
                    new TextFormField(
                      controller: regCtrl.desctxtController,
                      validator: (value) {
                        if (value.isEmpty) {
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
                        hintText: 'Description',
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
                          errorBorder: customerrorBorder

                      ),
                    ),
                    SizedBox(height: 10.0),
                    new TextFormField(
                      controller: regCtrl.fromtxtController,
                      validator: (value) {
                        if (value.isEmpty) {
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
                        hintText: 'From Place',
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
                          errorBorder: customerrorBorder

                      ),
                    ),
                    SizedBox(height: 10.0),
                    new TextFormField(
                      controller: regCtrl.totxtController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return errorField;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          fontFamily: 'Nunito Sans'),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'To Place',
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
                          errorBorder: customerrorBorder

                      ),
                    ),

                    SizedBox(height: 10.0),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                            onTap: () {
                              _fselectDate(context);
                            },
                            child: Row(
                              children: [
                                Text(regCtrl.fdob),
                                Spacer(),
                                Icon(Icons.date_range)
                              ],
                            ))),
                    SizedBox(height: 10.0),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Row(
                              children: [
                                Text(regCtrl.dob),
                                Spacer(),
                                Icon(Icons.date_range)
                              ],
                            ))),
                    SizedBox(height: 10.0),
                    new TextField(
                      enabled: false,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          fontFamily: 'Nunito Sans'),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: regCtrl.diff,
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
                          errorBorder: customerrorBorder

                      ),
                    ),
                    SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 1, groupValue: regCtrl.incity, onChanged: (index) {
                            regCtrl.inoutcity(1);

                          }),
                          Expanded(
                            child: Text('In City'),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 1, groupValue: regCtrl.outcity, onChanged: (index) {
                                regCtrl.inoutcity(2);
                          }),
                          Expanded(child: Text('Out City'))
                        ],
                      ),
                      flex: 1,
                    )]),

                    SizedBox(height: 10.0),

                    regCtrl.loading == true
                        ? const ProgressBarWidget():
                    InkWell(onTap: () async {

                      if(_formkey.currentState.validate()) {
                        final profileResponse = await pref.getLoginUserData();

                        if (profileResponse != null) {
                          regCtrl.Booking();
                        }
                        else {
                          Get.to(SignIn());
                        }
                      }

                    },child:
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: 10.0),
                  ],
                )),
          ),
        ))
      ]));
    });
  }
}
