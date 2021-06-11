import 'package:e_jex/const.dart';
import 'package:e_jex/screens/phone_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme(
              primary: mainColor,
              primaryVariant: mainColor,
              secondary: mainColor,
              secondaryVariant: mainColor,
              surface: mainColor,
              background: mainColor,
              error: mainColor,
              onPrimary: mainColor,
              onSecondary: mainColor,
              onSurface: mainColor,
              onBackground: mainColor,
              onError: mainColor,
              brightness: Brightness.light)),
      debugShowCheckedModeBanner: false,
      home: PhoneVerificationScreen(),
    );
  }
}
