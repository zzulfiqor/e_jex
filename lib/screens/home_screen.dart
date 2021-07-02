import 'package:e_jex/screens/order_process_screen.dart';
import 'package:e_jex/screens/send_screen.dart/send_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../const.dart';
import 'bike_screen/bike_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZStack(
        [
          // Background
          VStack(
            [
              Container(
                decoration: BoxDecoration(
                  gradient: appMainColorGradient,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(Get.width * .12),
                  ),
                ),
                height: Get.height * .23,
              ),
            ],
            axisSize: MainAxisSize.max,
          ),

          // Main
          VStack(
            [
              // EJex + Saldo
              VStack(
                [
                  // Title E-Jex
                  "E-JEX"
                      .text
                      .headline5(context)
                      .bold
                      .color(Colors.white)
                      .make(),

                  // Saldo
                  HStack(
                    [
                      "Rp".text.white.bold.make(),
                      4.widthBox,
                      "100.000"
                          .text
                          .headline6(context)
                          .white
                          .bold
                          .make()
                          .box
                          .padding(EdgeInsets.only(top: 10))
                          .make(),
                    ],
                  ),

                  Container(
                    height: Get.height * .125,
                    alignment: Alignment.bottomCenter,
                    child: HStack(
                      [
                        Icon(Icons.account_balance_wallet),
                        5.widthBox,
                        "Isi Saldo Wallet".text.bold.color(mainColor).make()
                      ],
                      crossAlignment: CrossAxisAlignment.center,
                      alignment: MainAxisAlignment.center,
                    )
                        .box
                        .color(Colors.white)
                        .height(58)
                        .width(Get.width * .75)
                        .withRounded(value: 10)
                        .shadowMd
                        .make(),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20).pOnly(top: 20),

              // Body Section
              (Get.height * .05).heightBox,
              HStack(
                [
                  _menuSelectionButton(
                          asset: "assets/scooter 1.png", title: "Bike")
                      .onTap(() {
                    Get.to(() => BikeScreen());
                  }),
                  _menuSelectionButton(
                      asset: "assets/vehicle 1.png", title: "Car"),
                  _menuSelectionButton(
                          asset: "assets/truck 1.png", title: "Send")
                      .onTap(() {
                    Get.to(() => SendScreen());
                  }),
                  _menuSelectionButton(
                      asset: "assets/Food Cart.png", title: "Food"),
                ],
                alignment: MainAxisAlignment.spaceEvenly,
              ).wFull(context).pSymmetric(h: 20),

              // Order Aktif
              25.heightBox,
              VStack([
                "Order Aktif".text.headline5(context).bold.make(),
                "Hari ini anda punya order aktif nih".text.bold.gray500.make(),
              ]).pSymmetric(h: 20),

              // Order Aktif Item
              10.heightBox,
              HStack([
                _orderAktifButton(title: "Bike", isFirst: true).onTap(() {
                  // Ktika di tap menuju order process screen
                  Get.to(OrderProcessScreen());
                }),

                //
                _orderAktifButton(title: "Car"),
              ]).wFull(context).scrollHorizontal(),

              // Voucher Promo
              25.heightBox,
              VStack([
                "Voucher Promo".text.headline5(context).bold.make(),
                "Dapatkan voucher promo gratis hari ini"
                    .text
                    .bold
                    .gray500
                    .make(),
              ]).pSymmetric(h: 20),

              // Voucher Promo Item
              10.heightBox,
              HStack([
                _voucherPromoButton(
                    title: "Bike", subtitle: "Voucher 50 %", isFirst: true),
                _voucherPromoButton(title: "Car", subtitle: "Voucher 25 %"),
              ]).wFull(context).scrollHorizontal(),

              //
            ],
            axisSize: MainAxisSize.max,
          ).safeArea().scrollVertical(),
        ],
      ).whFull(context).backgroundColor(backgroundColor),
    );
  }

  Widget _orderAktifButton({String? title, bool isFirst = false}) {
    return "$title"
        .text
        .size(14)
        .white
        .bold
        .make()
        .box
        .margin(EdgeInsets.only(left: isFirst ? 20 : 10))
        .height(85)
        .width(85)
        .color(mainColor)
        .alignBottomCenter
        .padding(EdgeInsets.all(10))
        .withRounded(value: 12)
        .make();
  }

  Widget _voucherPromoButton(
      {String? title, String? subtitle, bool isFirst = false}) {
    return VStack(
      [
        "$title".text.size(14).white.bold.makeCentered(),
        4.heightBox,
        "$subtitle".text.size(10).white.makeCentered(),
      ],
    )
        .box
        .margin(EdgeInsets.only(left: isFirst ? 20 : 10))
        .height(85)
        .width(95)
        .color(mainColor)
        .alignCenter
        .padding(EdgeInsets.all(10))
        .withRounded(value: 12)
        .make();
  }

  Widget _menuSelectionButton({String? asset, String? title}) {
    return VStack(
      [
        Image.asset('$asset'),
        "$title".text.bold.color(mainColor).makeCentered(),
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).box.roundedSM.height(75).width(75).alignCenter.white.shadowSm.make();
  }
}
