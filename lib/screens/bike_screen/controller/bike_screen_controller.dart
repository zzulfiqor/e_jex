import 'dart:developer';

import 'package:e_jex/screens/bike_screen/widgets/driver_detail_dialog.dart';
import 'package:e_jex/screens/bike_screen/widgets/order_summary_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum BikeScreenState { loading, success, failed }
enum BikeScreenStepState {
  pickTujuan,
  pickMyLocation,
  orderSummary,
  driverDetail
}

class BikeScreenController extends GetxController {
  // Controllers
  TextEditingController searchController = TextEditingController();

  // State
  RxString location = "Lawang Sewu".obs;
  Rx<BikeScreenStepState> stepState = BikeScreenStepState.pickTujuan.obs;
  Rx<BikeScreenState>? state;

  // MAP
  GoogleMapController? mapController;
  var initialCameraPosition =
      CameraPosition(target: LatLng(-6.983491, 110.410609), zoom: 16.0);

  // change
  void change(string) => location.value = "$string";

  // nextStep
  void nextStep(step) {
    log("Step -> " + step.toString());
    if (step == BikeScreenStepState.pickTujuan) {
      this.stepState.value = BikeScreenStepState.pickMyLocation;
    } else if (step == BikeScreenStepState.pickMyLocation) {
      this.stepState.value = BikeScreenStepState.orderSummary;
    } else if (step == BikeScreenStepState.orderSummary) {
      Get.bottomSheet(OrderSummaryDialog());
    } else {
      Get.back();
      Get.bottomSheet(DriverDetailDialog());
    }
  }

  // =========================================================================

  @override
  void onInit() {
    this.state?.value = BikeScreenState.loading;
    log("${this.state}");
    super.onInit();
  }

  @override
  void onClose() {
    mapController?.dispose();
    super.onClose();
  }
}
