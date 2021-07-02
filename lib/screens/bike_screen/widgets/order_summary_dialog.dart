import 'package:e_jex/const.dart';
import 'package:e_jex/screens/bike_screen/controller/bike_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderSummaryDialog extends StatelessWidget {
  OrderSummaryDialog({Key? key}) : super(key: key);

  BikeScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Get.width,
      child: VStack(
        [
          // Bike 1 Orang
          Transform.translate(
            offset: Offset(0, -7.5),
            child: HStack(
              [
                // Type
                "Bike".text.semiBold.color(mainColor).make(),

                // Jumlah Orng
                "1 Orang".text.semiBold.color(mainColor).make()
              ],
              alignment: MainAxisAlignment.spaceBetween,
            )
                .wFull(context)
                .box
                .topRounded(value: 10)
                .padding(
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0))
                .color(Colors.white)
                .make(),
          ),

          // Divider
          Divider(),

          // Timeline
          Transform.translate(
            offset: Offset(-Get.width * .4, 0),
            child: VStack([
              TimelineTile(
                contents: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Saat Ini',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Lawang Sewu',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                node: TimelineNode(
                  indicator: DotIndicator(
                    size: 20,
                    color: mainColor,
                    border: Border.all(color: Colors.white),
                  ),
                  endConnector: SolidLineConnector(
                    color: mainColor,
                  ),
                ),
              ),

              // Tujuan
              TimelineTile(
                contents: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Tujuan',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Jl Imam Bonjol 163',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                node: TimelineNode(
                  indicator: DotIndicator(
                    size: 20,
                    color: mainColor,
                    border: Border.all(color: Colors.white),
                  ),
                  startConnector: SolidLineConnector(
                    color: mainColor,
                  ),
                ),
              )
            ]).paddingSymmetric(vertical: 18),
          ),

          // Order SUmmary
          HStack(
            [
              "Order Bike"
                  .text
                  .subtitle1(context)
                  .color(Colors.white)
                  .bold
                  .make(),
              HStack(
                [
                  "Rp. 25.000".text.color(Colors.white).semiBold.make(),

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
            controller.nextStep(BikeScreenStepState.driverDetail);
          }),
        ],
        axisSize: MainAxisSize.min,
      ),
    );
  }
}
