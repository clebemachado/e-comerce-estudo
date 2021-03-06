import 'package:flutter/material.dart';
import './size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

// Estilo Texto
final headingStyle = TextStyle(
  color: Colors.black,
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9].[a-zA-Z]+");
const String kEmailNullError = "Please. Enter your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your Password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhonePassError = "Please Enter your phone number";
const String kAddressPassError = "Please Enter your address";

final optInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  enabledBorder: outlineInputDecoration(),
  focusedBorder: outlineInputDecoration(),
  border: outlineInputDecoration(),
);

OutlineInputBorder outlineInputDecoration() {
  return OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: kTextColor),
);
}
