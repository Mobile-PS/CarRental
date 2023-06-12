import 'package:car_rental/api/constants.dart';
import 'package:car_rental/models/buses_list_model.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/data.dart';
import 'package:car_rental/constants.dart';

Widget buildCar2(int index,Buses buses){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[


        Container(
          height: 100,
          child: Center(
            child:  Image.network(
                ApiConstants().imagebaseUrl+buses.photo,
                fit: BoxFit.fitWidth,
              ),
            ),

        ),

        SizedBox(
          height: 24,
        ),

       /* Text(
          car.model,
          style: TextStyle(
            fontSize: 18
          ),
        ),

        SizedBox(
          height: 8,
        ),*/

        Text(
          buses.busName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),

      /*  Text(
          "per " + (car.condition == "Daily" ? "day" : car.condition == "Weekly" ? "week" : "month"),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),*/

      ],
    ),
  );
}