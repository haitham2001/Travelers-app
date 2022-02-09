import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData DarkMode =ThemeData
  (
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor('333739'),
    elevation: 10.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  ),

  textTheme: TextTheme(
    // For Headers
    bodyText1: TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 15,
      color: Colors.grey,
    ),
  ),

);
ThemeData LightMode =ThemeData(
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 15,
      color: Colors.grey[600],
    ),
  ),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: defaultColor,
    elevation: 10.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  ),

);