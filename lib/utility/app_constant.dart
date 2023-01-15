import 'package:flutter/material.dart';

class AppConstant {
  static Color dark = Colors.black;
  static Color bgColor = Colors.white;

  TextStyle h1Style({double? size, Color? color}) {
    return TextStyle(
      fontSize: size ?? 48,
      fontWeight: FontWeight.bold,
      color: color ?? dark,
    );
  }

  TextStyle h2Style({double? size, Color? color}) {
    return TextStyle(
      fontSize: size ?? 22,
      fontWeight: FontWeight.w700,
      color: color ?? dark,
    );
  }

  TextStyle h3Style({double? size, Color? color}) {
    return TextStyle(
      fontSize: size ?? 14,
      fontWeight: FontWeight.normal,
      color: color ?? dark,
    );
  }









}
