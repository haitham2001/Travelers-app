import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData DarkMode =ThemeData
  (
    scaffoldBackgroundColor: HexColor('333739'),

    // default Color for Whole the App
    primarySwatch: defaultColor,

    appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor('333739'),
    elevation: 10.0,


    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
    ),
  ),

  textTheme: const TextTheme(

    // controller color in TextFormField
    subtitle1: TextStyle(
      color: Colors.white,
    ),


    // For Headers
    headline1: TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.4
    ),

    // For Normal Text
    bodyText1: TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),


    // Label Style in TextFormField
    bodyText2: TextStyle(
      fontSize: 15,
      color: Colors.white,
    ),


  ),

);



ThemeData LightMode =ThemeData(

  textTheme: TextTheme(
    // For Headers
    headline1: const TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.4
    ),

    // Normal Text
    bodyText1: const TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),


    // Label Style in TextFormField
    bodyText2: TextStyle(
      fontSize: 15,
      color: Colors.grey[600],
    ),


  ),

  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: defaultColor,
    elevation: 10.0,


    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
    ),

  ),

);