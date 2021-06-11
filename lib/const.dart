import 'package:flutter/material.dart';

// Color
var mainColor = Color(0xff3E4095);
var mainColorLight = Color(0xff73749C);
var backgroundColor = Color(0xffECECEC);

// Gradient
var appMainColorGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    mainColor,
    mainColorLight,
  ],
);
