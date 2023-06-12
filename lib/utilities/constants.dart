import 'package:flutter/material.dart';

const kCategoryTextStyle = TextStyle(
  color: Color(0xff626262),
  fontWeight: FontWeight.w600,
);

const kPrimaryBlue = Color(0xff040f48);

const kSmallDescColor = Color(0xff50436e);

const kSmallDescStyle = TextStyle(fontSize: 12, color: kSmallDescColor);

const kMediumDescStyle = TextStyle(fontSize: 14, color: kSmallDescColor);

const kLargeDescStyle = TextStyle(fontSize: 17, color: kSmallDescColor,  	fontWeight: FontWeight.bold);
const borderColor = Color.fromRGBO(229, 231, 235, 1);

const kTextcolor = Color(0xff019734);
const kTextcolor1 = Color(0xff07be45);
const kTextcolor2 = Color(0xff00d649);
const kTextcolor3 = Color(0xff00ff57);
const kTextcolor4 = Color(0xff004e1b);
const kTextcolor5 = Color(0xff515151);
const kTextcolor6 = Color(0xff213095);
const kTextcolor7 = Color(0xffe2f2e7);
const kPrimaryColor1 = Color(0xFF7033FF);
const kPrimaryColor2 = Color(0xFFDFE4F6);

const kTextcolor11 = Color(0xffe2f2e7);
const kTextcolor8 = Color(0xff005c1f);
const toogletextColor = Color.fromRGBO(108, 112, 114, 1);

final kShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

final customerrorBorder =  OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: Colors.red,
    width: 1.0,
  ),
);

final RegExp emailRegex = new RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

final errorField = "Required field";