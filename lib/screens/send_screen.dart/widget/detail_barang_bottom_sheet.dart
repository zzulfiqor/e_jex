import 'package:e_jex/const.dart';
import 'package:e_jex/screens/send_screen.dart/controller/send_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailBarangBottomSheet extends StatelessWidget {
  DetailBarangBottomSheet({Key? key}) : super(key: key);

  SendScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => VStack([
          24.heightBox,
          VxBox(
            child: "Detail Barang"
                .text
                .color(mainColor)
                .subtitle1(context)
                .bold
                .make(),
          ).padding(EdgeInsets.symmetric(horizontal: 20)).make(),

          // Deskripsi Barang
          VStack([
            8.heightBox,
            "Deskripsi Barang".text.bold.make(),
            VxTextField(
              borderType: VxTextFieldBorderType.none,
              fillColor: Colors.transparent,
            )
                .box
                .height(45)
                .withRounded(value: 10)
                .padding(EdgeInsets.all(5))
                .white
                .border(color: Colors.grey)
                .make()
          ]).paddingSymmetric(horizontal: 20, vertical: 5),

          // Metode Pengiriman
          VStack([
            "Metode Pengiriman".text.bold.color(mainColor).make(),
          ]).paddingSymmetric(horizontal: 20, vertical: 10),

          // Option Car
          HStack([
            Image.asset('assets/truck 1.png')
                .box
                .color(mainColor.withOpacity(.5))
                .padding(EdgeInsets.all(5))
                .withRounded(value: 10)
                .make(),

            // Tulisan
            8.widthBox,
            "Car".text.bold.subtitle1(context).bold.make().expand(),

            //
            "Rp.25.000,-".text.bold.subtitle1(context).bold.make(),
          ])
              .wFull(context)
              .box
              .width(Get.width)
              .padding(EdgeInsets.all(10))
              .withRounded(value: 10)
              .border(
                  width: 1.5,
                  color:
                      (controller.typeKendaraan.value == SendTypeKendaraan.car)
                          ? mainColor
                          : Colors.transparent)
              .color(mainColorLighter)
              .make()
              .box
              .padding(EdgeInsets.symmetric(horizontal: 20))
              .make()
              .onTap(() {
            controller.pickType(SendTypeKendaraan.car);
          }),

          // Option Bike
          10.heightBox,
          HStack([
            Image.asset('assets/scooter 1.png')
                .box
                .color(mainColor.withOpacity(.5))
                .padding(EdgeInsets.all(5))
                .withRounded(value: 10)
                .make(),

            // Tulisan
            8.widthBox,
            "Bike".text.bold.subtitle1(context).bold.make().expand(),

            //
            "Rp.25.000,-".text.bold.subtitle1(context).bold.make(),
          ])
              .wFull(context)
              .box
              .width(Get.width)
              .padding(EdgeInsets.all(10))
              .withRounded(value: 10)
              .border(
                  width: 1.5,
                  color:
                      (controller.typeKendaraan.value == SendTypeKendaraan.bike)
                          ? mainColor
                          : Colors.transparent)
              .color(mainColorLighter)
              .make()
              .box
              .padding(EdgeInsets.symmetric(horizontal: 20))
              .make()
              .onTap(() {
            controller.pickType(SendTypeKendaraan.bike);
          }),

          // Lanjutkan
          16.heightBox,
          HStack(
            [
              "Lanjutkan"
                  .text
                  .subtitle1(context)
                  .color(Colors.white)
                  .bold
                  .make(),
              HStack(
                [
                  // Icon
                  8.widthBox,
                  Icon(Icons.chevron_right)
                      .box
                      .padding(EdgeInsets.all(4))
                      .withRounded(value: 10)
                      .color(Colors.white)
                      .make()
                ],
              )
            ],
            alignment: MainAxisAlignment.spaceBetween,
            axisSize: MainAxisSize.max,
          )
              .wFull(context)
              .box
              .padding(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
              .gradientFromTo(from: mainColor, to: mainColorLight)
              .make()
              .onTap(() {
            Get.back();
            controller.nextStep(SendScreenStepState.delivery);
          }),
        ]).box.topRounded(value: 10).white.make());
  }
}
