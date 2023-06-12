// @dart=2.9

import 'package:car_rental/MySeparator.dart';
import 'package:flutter/material.dart';

class CustomRowComponent extends StatelessWidget {

  final String title;
  final String value;

  CustomRowComponent({@required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 0, right: 0, top: 4, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 13.0, color: Colors.black,fontFamily:'CastelTBook'),
              ),
              SizedBox(
                width: 4,
              ),
              Flexible(
                child: Container(
                  child: Text(
                    value.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0,top: 5.0,bottom: 5.0),
          child: MySeparator(color: Colors.black12)
        )
      ],
    );
  }
}
