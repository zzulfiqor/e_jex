import 'package:e_jex/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:velocity_x/velocity_x.dart';

import '../const.dart';

class OrderProcessScreen extends StatelessWidget {
  const OrderProcessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZStack([
        SingleChildScrollView(
          child: Container(
            child: VStack([
              // Main
              (Get.height * .1).heightBox,
              VStack([
                // Image
                Image.asset('assets/loading_image.png').centered(),
                // Container
                VStack(
                  [
                    15.heightBox,
                    VStack([
                      // 1
                      TimelineTile(
                        oppositeContents: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text('20 : 25',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        contents: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Pesanan Terkonfirmasi',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        node: TimelineNode(
                          indicator: DotIndicator(
                            size: 20,
                            color: mainColor,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          endConnector: SolidLineConnector(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // 1
                      TimelineTile(
                          contents: SizedBox(
                            height: 30,
                          ),
                          node: TimelineNode(
                            endConnector: SolidLineConnector(
                              color: Colors.white,
                            ),
                            startConnector: SolidLineConnector(
                              color: Colors.white,
                            ),
                          )),
                      TimelineTile(
                        oppositeContents: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text('20 : 27',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        contents: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Pengemudi Ditugaskan',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        node: TimelineNode(
                          indicator: DotIndicator(
                            size: 20,
                            color: mainColor,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          startConnector: SolidLineConnector(
                            color: Colors.white,
                          ),
                          endConnector: SolidLineConnector(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // 2
                      TimelineTile(
                          contents: SizedBox(
                            height: 30,
                          ),
                          node: TimelineNode(
                            endConnector: SolidLineConnector(
                              color: Colors.white,
                            ),
                            startConnector: SolidLineConnector(
                              color: Colors.white,
                            ),
                          )),
                      TimelineTile(
                        oppositeContents: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text('-- : --',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        contents: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Pengambilan',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        node: TimelineNode(
                          indicator: DotIndicator(
                            size: 20,
                            color: mainColor,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          startConnector: SolidLineConnector(
                            color: Colors.white,
                          ),
                          endConnector: SolidLineConnector(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // 2
                      TimelineTile(
                          contents: SizedBox(
                            height: 30,
                          ),
                          node: TimelineNode(
                            endConnector: SolidLineConnector(
                              color: Colors.white,
                            ),
                            startConnector: SolidLineConnector(
                              color: Colors.white,
                            ),
                          )),
                      TimelineTile(
                        oppositeContents: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text('-- : --',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        contents: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Pengambilan \nSelesai',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        node: TimelineNode(
                          indicator: DotIndicator(
                            size: 20,
                            color: mainColor,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          startConnector: SolidLineConnector(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]).scrollVertical(),
                  ],
                )
                    .box
                    .width(Get.width)
                    .height(Get.height)
                    .gradientFromTo(from: mainColor, to: mainColorLight)
                    .topRounded(value: 12)
                    .make()
              ]),
            ]),
          ),
        ),

        // Appbar
        AppAppBar(),
      ]).safeArea(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Image.asset('assets/Home.png'),
          ),
          BottomNavigationBarItem(
            label: "Order",
            icon: Image.asset('assets/Deliver Food.png'),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Image.asset('assets/Account.png'),
          ),
        ],
      ),
    );
  }
}
