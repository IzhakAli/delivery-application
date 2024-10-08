import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/orders/details_data.dart';
import '../../data/model/cartmodel.dart';
import '../../data/model/ordersmodel.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  late OrdersModel ordersModel;

  late Completer<GoogleMapController> completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? cameraPosition;
  intialData() {
    completercontroller = Completer<GoogleMapController>();
    if (ordersModel.ordersType == 0 &&
        ordersModel.addressLat != null &&
        ordersModel.addressLong != null) {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat.toString()),
            double.parse(ordersModel.addressLong.toString())),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat.toString()),
              double.parse(ordersModel.addressLong.toString()))));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response =
        await ordersDetailsData.getData(ordersModel.ordersId!.toString());

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
