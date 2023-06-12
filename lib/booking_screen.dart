import 'dart:io';


import 'package:car_rental/controllers/bookingList_screen_controller.dart';
import 'package:car_rental/quotes_expanded_tile.dart';
import 'package:car_rental/utilities/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookingscreen extends StatefulWidget {
  @override
  _Bookingscreen createState() => _Bookingscreen();
}

class _Bookingscreen extends State<Bookingscreen> {
  final con = Get.put(BookingListScreenController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
              height: 20,
            ),
            Row(
              children: [

                SizedBox(width: MediaQuery.of(context).size.width / 3),
                Center(
                  child: Text(
                    'My Booking',
                    style: TextStyle(color: Colors.black,fontSize: 22.0,fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            GetBuilder(
                init: con,
                builder: (context) {
                  if (con.loading) {
                    return  Expanded(child:
                        Center(child: ProgressBarWidget()));
                  }
                  else {
                    if (con.loginScreenResponse !=null && con.loginScreenResponse.data.length > 0) {
                      return Expanded(child:
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child:
                          ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: con.loginScreenResponse.data != null ? con
                                  .loginScreenResponse.data.length : 0,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 4),
                                    child: ExpandedTile(
                                      quotesResults: con.loginScreenResponse.data[index],)
                                );
                              }))
                      );
                    }
                    else{
                      return Expanded(child: Center(
                          child: Text(
                            'No Booking found !',
                            style: TextStyle(color: Colors.black,fontSize: 18.0),
                          )));
                    }
                  }
                })

            ])));

  }
}
