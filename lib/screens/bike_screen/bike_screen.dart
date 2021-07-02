import 'dart:developer';

import 'package:e_jex/const.dart';
import 'package:e_jex/screens/bike_screen/controller/bike_screen_controller.dart';
import 'package:e_jex/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class BikeScreen extends StatelessWidget {
  BikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetX<BikeScreenController>(
        init: BikeScreenController(),
        initState: (_) {
          log("ini adalah state bike screen controller ${_.controller?.location.value} <-- kosong");
        },
        builder: (controller) {
          return ZStack([
            // Map
            Container(
              height: Get.height,
              width: Get.width,
              child: GoogleMap(
                initialCameraPosition: controller.initialCameraPosition,
                onMapCreated: (mapController) {
                  controller.mapController = mapController;
                },
                markers: {},
                onCameraMove: (position) {
                  log(position.toString());
                },
              ),
            ),

            //main
            VStack(
              [
                // Appnar + Search
                VStack([
                  // Appbar
                  AppAppBar(),

                  // Search
                  12.heightBox,
                  HStack([
                    Icon(Icons.search),

                    // Text FIeld
                    8.widthBox,
                    VxTextField(
                      contentPaddingTop: 15,
                      controller: controller.searchController,
                      onChanged: (value) {},
                      hint: "Masukkan Lokasi Tujuan",
                      fillColor: Colors.transparent,
                      borderType: VxTextFieldBorderType.none,
                    ).expand()
                  ])
                      .paddingSymmetric(horizontal: 15)
                      .box
                      .color(Colors.white)
                      .withRounded(value: 12)
                      .shadowMd
                      .margin(EdgeInsets.symmetric(horizontal: 20))
                      .make(),
                ]),

                // Panel
                ZStack([
                  // Container
                  VStack([
                    // Lokasi  / Anda
                    (controller.stepState.value ==
                            BikeScreenStepState.pickTujuan)
                        ? "Lokasi Tujuan"
                            .text
                            .color(mainColor)
                            .semiBold
                            .make()
                            .onTap(() {})
                        : (controller.stepState.value ==
                                BikeScreenStepState.pickMyLocation)
                            ? "Lokasi Anda"
                                .text
                                .color(mainColor)
                                .semiBold
                                .make()
                                .onTap(() {})
                            : "Lokasi Anda"
                                .text
                                .color(mainColor)
                                .semiBold
                                .make()
                                .onTap(() {}),
                    // Nama Lokasi
                    8.heightBox,
                    "${controller.location.value}"
                        .text
                        .bold
                        .headline5(context)
                        .make(),
                    // Detail ALamat Lokasi
                    8.heightBox,
                    "Jalan Tugu Muda".text.color(Colors.grey).make(),
                  ])
                      .box
                      .width(Get.width)
                      .color(Colors.white)
                      .padding(EdgeInsets.all(20))
                      .make(),

                  // Button
                  Positioned(
                    top: -(Get.height * .03),
                    right: Get.width * .05,
                    child: _customFloatingButton(
                      onButtonTap: () {
                        controller.nextStep(controller.stepState.value);
                      },
                    ),
                  ),
                ]),
              ],
              alignment: MainAxisAlignment.spaceBetween,
            ).whFull(context),
          ]);
        },
      )),
    );
  }

  Widget _customFloatingButton({Function()? onButtonTap}) {
    return VxBox(
            child: Icon(
      Icons.chevron_right,
      color: Colors.white,
    ))
        .height(45)
        .width(45)
        .withRounded(value: 10)
        .color(mainColor)
        .make()
        .box
        .color(mainColorLighter)
        .padding(EdgeInsets.all(10))
        .height(60)
        .withRounded(value: 10)
        .width(60)
        .make()
        .onTap(() {
      onButtonTap!();
    });
  }
}
