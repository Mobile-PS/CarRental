import 'package:car_rental/constants.dart';
import 'package:car_rental/controllers/booking_screen_controller.dart';
import 'package:car_rental/models/buses_list_model.dart';
import 'package:car_rental/showroom.dart';
import 'package:car_rental/signin.dart';
import 'package:car_rental/utilities/constants.dart';
import 'package:car_rental/utilities/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'preferences/pref_repository.dart';

class CarFilterForm extends StatefulWidget {


  @override
  _CarFilterForm createState() => _CarFilterForm();
}

class _CarFilterForm extends State<CarFilterForm> {
  var currentSelectedValue;
  static const deviceTypes = ["India", "AUS", "USA"];
  final pref = PrefRepository();

  final regCtrl = Get.put(BookingScreenController());

  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  bool isSwitched = false;
  double width = 300.0;
  double height = 35.0;
  double loginAlign = -1;
  double signInAlign = 1;
  double xAlign;
  Color loginColor;
  Color signInColor;
  double compsize;
  double thirdsize;
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
      regCtrl.DOB(DateFormat.yMMMd().format(picked), picked);
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

      regCtrl.FDOB(DateFormat.yMMMd().format(picked1), picked1);
    }
  }


  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = Colors.white;
    signInColor = toogletextColor;
    compsize = 15.0;
    thirdsize = 13.0;
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingScreenController>(builder: (_) {
      return Scaffold(
          body: SingleChildScrollView(
              child:
              Column(children: <Widget>[
                SizedBox(height: 60,),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor2,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment: Alignment(xAlign, 0),
                          duration: const Duration(milliseconds: 300),
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: height,
                                decoration: const BoxDecoration(
                                  color: kPrimaryColor1,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            // agentController.toogleBuyerseller(true, false);
                            setState(() {
                              isSwitched=false;
                              xAlign = loginAlign;
                              loginColor = Colors.white;
                              signInColor = Colors.black;
                              thirdsize = 13.0;
                              compsize = 15.0;
                            });
                          },
                          child: Align(
                            alignment: const Alignment(-1, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                  'Round Trip',
                                  style:
                                  TextStyle(fontSize: compsize,
                                      color: loginColor,
                                      fontFamily: 'CastelTBook')

                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // agentController.toogleBuyerseller(false, true);
                           // con.updateIndividual(false);
                            setState(() {
                              isSwitched=true;
                              xAlign = signInAlign;
                              loginColor = Colors.black;
                              signInColor = Colors.white;
                              thirdsize = 15.0;
                              compsize = 13.0;

                            });
                          },
                          child: Align(
                            alignment: const Alignment(1, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                  'One Way Trip',
                                  style:
                                  TextStyle(fontSize: thirdsize,
                                      color: signInColor,
                                      fontFamily: 'CastelTBook')
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               /* Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('One Way Trip', style: TextStyle(
                        color: Color.fromRGBO(65, 64, 66, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        fontFamily: 'Nunito Sans')),
                    Switch(
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      value: isSwitched,
                      activeColor: kTextcolor,
                      activeTrackColor: kTextcolor7,
                      inactiveThumbColor: kTextcolor,
                      inactiveTrackColor: kTextcolor7,
                    ),
                    Text('Round Trip', style: TextStyle(
                        color: Color.fromRGBO(65, 64, 66, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        fontFamily: 'Nunito Sans')),
                  ],
                ),*/
                Visibility(
                    visible: isSwitched?true:false,
                    child:
                    Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                            key: _formkey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                SizedBox(height: 20.0),
                                Text('Pickup Point',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Nunito Sans')),
                                SizedBox(height: 5.0),
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
                                      hintText: 'Pickup Point',
                                      suffixIcon:  Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.check_circle_outline_outlined,
                                          size: 16,
                                          color: Colors.green,
                                        ),),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(7.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.grey)),
                                      errorBorder: customerrorBorder
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text('Destination Point',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Nunito Sans')),
                                SizedBox(height: 5.0),
                                new TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: regCtrl.mobiletxtController,
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
                                      hintText: 'Destination Point',
                                      suffixIcon:  Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.check_circle_outline_outlined,
                                          size: 16,
                                          color: Colors.green,
                                        ),),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(7.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.grey)),
                                      errorBorder: customerrorBorder

                                  ),
                                ),

                                SizedBox(height: 10.0),
                                Text('Number Of passenger',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Nunito Sans')),
                                SizedBox(height: 5.0),
                                new TextFormField(
                                  keyboardType: TextInputType.number,
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
                                        borderRadius: BorderRadius.circular(7.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(7.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.grey)),
                                      errorBorder: customerrorBorder

                                  ),
                                ),
                                SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Expanded(child:
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('From When',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Nunito Sans')),
                                SizedBox(height: 5.0),
                                Container(
                                    height: 60,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)
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
                                        ))),])),
                                SizedBox(width: 10.0),
                          Expanded(child:
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Till When',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Nunito Sans')),
                                SizedBox(height: 5.0),
                                Container(
                                    height: 60,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)
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
                                        ))),])),
                                ]),
                                SizedBox(height: 10.0),
                                Text('Varient',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Nunito Sans')),
                                SizedBox(height: 5.0),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Radio(
                                                value: 1,
                                                groupValue: regCtrl.incity,
                                                onChanged: (index) {
                                                  regCtrl.inoutcity(1);
                                                }),
                                            Expanded(
                                              child: Text('Ac'),
                                            )
                                          ],
                                        ),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Radio(
                                                value: 1,
                                                groupValue: regCtrl.outcity,
                                                onChanged: (index) {
                                                  regCtrl.inoutcity(2);
                                                }),
                                            Expanded(child: Text('Non Ac'))
                                          ],
                                        ),
                                        flex: 1,
                                      )
                                    ]),

                                SizedBox(height: 10.0),

                                regCtrl.loading == true
                                    ? const ProgressBarWidget() :
                                InkWell(onTap: () async {
                                  if (_formkey.currentState.validate()) {
                                    Get.to(Showroom());

                                  }
                                }, child:
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
                                        "Proceed",
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
                    )),
              Visibility(
                  visible: !isSwitched?true:false,
                  child:
              Container(
              color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                      key: _formkey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          SizedBox(height: 20.0),
                          Text('Pickup Point',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'Nunito Sans')),
                          SizedBox(height: 5.0),
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
                                hintText: 'Pickup Point',
                                suffixIcon:  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.check_circle_outline_outlined,
                                      size: 16,
                                      color: Colors.green,
                                    ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.grey)),
                                errorBorder: customerrorBorder
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text('Destination Point',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'Nunito Sans')),
                          SizedBox(height: 5.0),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: regCtrl.mobiletxtController,

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
                                hintText: 'Destination Point',
                                suffixIcon:  Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.check_circle_outline_outlined,
                                    size: 16,
                                    color: Colors.green,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.grey)),
                                errorBorder: customerrorBorder

                            ),
                          ),
                          SizedBox(height: 10.0),

                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: regCtrl.mobiletxtController,
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
                                hintText: 'Enter destination location',
                                suffixIcon:  Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.menu,
                                    size: 16,
                                    color: Colors.black,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.grey)),
                                errorBorder: customerrorBorder

                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width/2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: kPrimaryColor2,
                                  border: Border.all(color: Colors.grey)
                              ),
                              padding: EdgeInsets.all(10.0),
                              child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('add another location'),
                                    ],
                                  )),
                          SizedBox(height: 10.0),
                          Text('Return Location',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'Nunito Sans')),
                          SizedBox(height: 5.0),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: regCtrl.mobiletxtController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return errorField;
                              }
                              else if (value.length < 10) {
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
                                hintText: 'Return Location',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.grey)),

                                errorBorder: customerrorBorder

                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text('Number Of passenger',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'Nunito Sans')),
                          SizedBox(height: 5.0),
                          new TextFormField(
                            keyboardType: TextInputType.number,
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
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.grey)),
                                errorBorder: customerrorBorder

                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('From When',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'Nunito Sans')),
                          SizedBox(height: 5.0),
                          Container(
                              height: 60,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white,
                                 border: Border.all(color: Colors.grey)
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
                          ],)),
                          SizedBox(width: 10.0),
                              Expanded(child:
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                        Text('Till When',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'Nunito Sans')),
                          SizedBox(height: 5.0),
                          Container(
                              height: 60,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white,
                                  border: Border.all(color: Colors.grey)

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
                                  )))])),
                          ],),
                          SizedBox(height: 10.0),
                          Text('Varient',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'Nunito Sans')),
                          SizedBox(height: 5.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio(
                                          value: 1,
                                          groupValue: regCtrl.incity,
                                          onChanged: (index) {
                                            regCtrl.inoutcity(1);
                                          }),
                                      Expanded(
                                        child: Text('Ac'),
                                      )
                                    ],
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio(
                                          value: 1,
                                          groupValue: regCtrl.outcity,
                                          onChanged: (index) {
                                            regCtrl.inoutcity(2);
                                          }),
                                      Expanded(child: Text('Non Ac'))
                                    ],
                                  ),
                                  flex: 1,
                                )
                              ]),

                          SizedBox(height: 10.0),

                          regCtrl.loading == true
                              ? const ProgressBarWidget() :
                          InkWell(onTap: () async {
                            if (_formkey.currentState.validate()) {
                             Get.to(Showroom());
                            }
                          }, child:
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
                                  "Proceed",
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
          ])));
    });
  }
}
