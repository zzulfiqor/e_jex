import 'package:e_jex/const.dart';
import 'package:e_jex/screens/send_screen.dart/controller/send_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailSendBottomSheet extends StatelessWidget {
  final bool isPenerima;
  DetailSendBottomSheet({Key? key, required this.isPenerima}) : super(key: key);

  SendScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return VStack([
      24.heightBox,
      VxBox(
        child: "Detail Penerima"
            .text
            .color(mainColor)
            .subtitle1(context)
            .bold
            .make(),
      ).padding(EdgeInsets.symmetric(horizontal: 20)).make(),

      // Edit Info
      HStack(
        [
          // Nama Tempat
          // Alamat
          VStack([
            "Lawang Sewu".text.bold.size(18).make(),
            "Jalan Tugu Muda"
                .text
                .color(Colors.black.withOpacity(.4))
                .semiBold
                .make(),
          ]),

          // Button Edit
          ElevatedButton(onPressed: () {}, child: "Edit".text.white.make())
        ],
        alignment: MainAxisAlignment.spaceBetween,
      )
          .wFull(context)
          .paddingSymmetric(horizontal: 20, vertical: 15)
          .box
          .color(mainColorLighter.withOpacity(.5))
          .withRounded(value: 10)
          .make()
          .box
          .padding(EdgeInsets.symmetric(horizontal: 20, vertical: 10))
          .make(),

      // Nama Penerima
      VStack([
        "Detail Lokasi".text.bold.make(),
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

      // Nama Penerima
      VStack([
        "${(isPenerima == true) ? 'Nama Penerima' : 'Nama Pengirim'}"
            .text
            .bold
            .make(),
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

      // No HP Penerima
      VStack([
        "No. Handphone Penerima".text.bold.make(),
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

      // Lanjutkan
      16.heightBox,
      HStack(
        [
          "Lanjutkan".text.subtitle1(context).color(Colors.white).bold.make(),
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
        if (controller.stepState.value == SendScreenStepState.detailPenerima) {
          Get.back();
          controller.nextStep(SendScreenStepState.pickLokasiPengirim);
        } else {
          Get.back();
          controller.nextStep(SendScreenStepState.detailBarang);
        }
      }),
    ]).box.topRounded(value: 10).white.make();
  }
}
