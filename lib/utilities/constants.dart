
import 'package:flutter/material.dart';
// ignore: non_constant_identifier_names
final String SIGN_IN = 'signin';
// ignore: non_constant_identifier_names
final String SIGN_UP ='signup';
// ignore: non_constant_identifier_names
final String EVENT_SCREEN ='eventscreen';
// ignore: non_constant_identifier_names
final String HOME='home';
// ignore: non_constant_identifier_names
final String SPLASH_SCREEN ='splashscreen';
// ignore: non_constant_identifier_names
final String REGISTER='register';

final String ACCOUNT='account';

final String SCORE='score';

var token=' ';
var finalLoggedIN=' ';



final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFA726),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

