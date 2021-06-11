import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      // Appbar
      HStack([
        Icon(
          Icons.chevron_left_outlined,
          size: 26,
        ).safeArea().onTap(() {
          Get.back();
        }),
        10.widthBox,
        "Kembali".text.size(16).bold.gray500.make().safeArea(),
      ])
          .wFull(context)
          .box
          .white
          .bottomRounded(value: 12)
          .padding(EdgeInsets.only(bottom: 15, top: 15, left: 20, right: 20))
          .shadowSm
          .make(),
    ]);
  }
}
