import 'package:e_jex/const.dart';
import 'package:e_jex/screens/home_screen.dart';
import 'package:e_jex/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        // AppBar
        AppAppBar(),

        // Main Section
        30.heightBox,
        VStack([
          // Verification Box
          VStack([
            // Logo
            Image.asset('assets/ELANG EXPRESS 1.png').centered(),
            // Keterangan telah mengirimkan
            "Kami Telah mengirimkan kode OTP ke \n+62 8515 6781 185"
                .text
                .align(TextAlign.center)
                .bold
                .makeCentered()
                .box
                .margin(EdgeInsets.only(top: 20))
                .make(),
            // Verification
            VxPinView(
              type: VxPinBorderType.underline,
              count: 4,
              space: 15,
            )
                .centered()
                .box
                .margin(EdgeInsets.only(top: 20))
                .padding(
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 15))
                .shadowSm
                .white
                .withRounded(value: 12)
                .make(),
            // Countdown
            20.heightBox,
            "Kirim ulang kode dalam 00.15".text.bold.coolGray500.makeCentered(),
            25.heightBox,
          ])
              .box
              .width(Get.width)
              .rounded
              .white
              .padding(EdgeInsets.all(20))
              .shadowSm
              .make()
              .box
              .padding(EdgeInsets.symmetric(horizontal: 20))
              .make(),

          // Button
          20.heightBox,
          "Lanjutkan"
              .text
              .bold
              .size(16)
              .white
              .makeCentered()
              .box
              .border(color: Colors.white)
              .shadowSm
              .height(58)
              .color(mainColor)
              .roundedSM
              .make()
              .onTap(() {
                // Ketika di tap akan menuju ke home screen
                Get.to(HomeScreen());
              })
              .box
              .padding(EdgeInsets.symmetric(horizontal: 25))
              .make()
        ]),
      ]).scrollVertical(),
    );
  }
}
