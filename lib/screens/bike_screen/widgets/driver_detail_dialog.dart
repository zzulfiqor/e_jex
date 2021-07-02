import 'package:e_jex/screens/bike_screen/controller/bike_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../const.dart';

class DriverDetailDialog extends StatelessWidget {
  DriverDetailDialog({Key? key}) : super(key: key);
  BikeScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VxBox().width(Get.width).height(10).white.topRounded(value: 10).make(),
        VStack(
          [
            // Details
            HStack([
              // Photo
              VxBox()
                  .height(75)
                  .width(75)
                  .color(Colors.grey)
                  .withRounded(value: 12)
                  .make(),

              // Details
              16.widthBox,
              VStack([
                // Plat
                "H 1932 SMG".text.subtitle1(context).bold.make(),
                // Merk Motor
                4.heightBox,
                "Honda Supra".text.color(Colors.grey).bold.make(),
                // Nama Driver
                4.heightBox,
                HStack([
                  "Haidar Rafi Efendi".text.make(),

                  // Rating
                  8.widthBox,
                  HStack([
                    Icon(Icons.star, size: 16),
                    "3.9".text.white.make(),
                  ])
                      .box
                      .padding(EdgeInsets.symmetric(horizontal: 8, vertical: 2))
                      .color(Color(0xffB4D200))
                      .withRounded(value: 16)
                      .make(),

                  //
                ]),
              ]),
            ]).wFull(context),
            // Button
            16.heightBox,
            HStack([
              ElevatedButton(
                      onPressed: () {}, child: "Telfon".text.white.make())
                  .box
                  .height(50)
                  .width(Get.width * .4)
                  .make(),
              ElevatedButton(onPressed: () {}, child: "Chat".text.white.make())
                  .box
                  .height(50)
                  .width(Get.width * .4)
                  .make()
            ], alignment: MainAxisAlignment.spaceBetween)
                .wFull(context),
          ],
        )
            .box
            .white
            .padding(EdgeInsets.symmetric(horizontal: 20, vertical: 20))
            .make(),
      ],
    );
  }
}
