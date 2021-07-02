import 'dart:developer';

import 'package:e_jex/screens/send_screen.dart/widget/delivery_bottom_sheet.dart';
import 'package:e_jex/screens/send_screen.dart/widget/detail_barang_bottom_sheet.dart';
import 'package:e_jex/screens/send_screen.dart/widget/detail_send_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum SendScreenStepState {
  pickLokasiPenerima,
  detailPenerima,
  pickLokasiPengirim,
  detailPengirim,
  detailBarang,
  delivery
}

enum SendTypeKendaraan { bike, car }

class SendScreenController extends GetxController {
// Controllers
  TextEditingController searchController = TextEditingController();

  // State
  RxString location = "Lawang Sewu".obs;
  Rx<SendScreenStepState> stepState =
      SendScreenStepState.pickLokasiPenerima.obs;

  // Selexted Send Kendaraan
  Rx<SendTypeKendaraan> typeKendaraan = SendTypeKendaraan.bike.obs;

  // MAP
  GoogleMapController? mapController;
  var initialCameraPosition =
      CameraPosition(target: LatLng(-6.983491, 110.410609), zoom: 17.0);

  // nextStep
  void nextStep(step) {
    log("Step -> " + step.toString());
    if (step == SendScreenStepState.pickLokasiPenerima) {
      Get.bottomSheet(DetailSendBottomSheet(
        isPenerima: true,
      ));
      this.stepState.value = SendScreenStepState.detailPenerima;
    } else if (step == SendScreenStepState.detailPenerima) {
      Get.bottomSheet(DetailSendBottomSheet(
        isPenerima: false,
      ));
      this.stepState.value = SendScreenStepState.detailBarang;
    } else if (step == SendScreenStepState.detailBarang) {
      //
      Get.bottomSheet(DetailBarangBottomSheet());
      this.stepState.value = SendScreenStepState.delivery;
    } else if (step == SendScreenStepState.delivery) {
      Get.bottomSheet(DeliveryBottomSheet());
    }
  }

  // pick type
  void pickType(SendTypeKendaraan type) {
    log("you pick $type");
    if (type == SendTypeKendaraan.bike) {
      this.typeKendaraan.value = SendTypeKendaraan.bike;
    } else {
      this.typeKendaraan.value = SendTypeKendaraan.car;
    }
  }
  // =========================================================================

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    mapController?.dispose();
    super.onClose();
  }
}
