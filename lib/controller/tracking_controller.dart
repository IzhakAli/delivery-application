import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/controller/orders/accepted_controller.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/getdecodepolyline.dart';
import 'package:delivery/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/statusrequest.dart';
import '../data/model/ordersmodel.dart';

class TrackingController extends GetxController {
  MyServices myServices = Get.find();
  OrdersAcceptedController ordersAcceptedController =
      Get.put(OrdersAcceptedController());

  Timer? timer;

  StreamSubscription<Position>? positionStream;

  Set<Polyline> polylineSet = {};

  GoogleMapController? gmc;

  List<Marker> markers = [];

  late StatusRequest statusRequest = StatusRequest.success;

  late OrdersModel ordersModel;

  double? destlat;
  double? destlong;

  double? currentlat;
  double? currentlong;

  CameraPosition? cameraPosition;

  donedelivery() async {
    Get.dialog(
      AlertDialog(
        title: Text('Warning'),
        content: Text('Do you want to proceed and complete the delivery?'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Get.back(); // Close the dialog
            },
          ),
          TextButton(
            child: Text('Proceed'),
            onPressed: () async {
              // Close the dialog first
              Get.back();

              // Your logic after user has confirmed to proceed
              statusRequest = StatusRequest.loading;
              update();

              try {
                await ordersAcceptedController.doneDelivery(
                  ordersModel.ordersId.toString(),
                  ordersModel.ordersUsersid.toString(),
                );
                Get.offAllNamed(AppRoute.homePage);
              } catch (e) {
                Get.snackbar('Error', 'Failed to complete delivery: $e');
              }
            },
          ),
        ],
      ),
      barrierDismissible: false, // User must tap a button to close the dialog
    );
  }

  getCurrentLocation() {
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat.toString()),
          double.parse(ordersModel.addressLong.toString())),
      zoom: 12.4746,
    );

    markers.add(Marker(
        markerId: MarkerId("dest"),
        position: LatLng(double.parse(ordersModel.addressLat.toString()),
            double.parse(ordersModel.addressLong.toString()))));

    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print("==================== Current Position");
      currentlat = position!.latitude;
      currentlong = position!.longitude;
      print(position!.latitude);
      print(position.longitude);
      if (gmc != null) {
        gmc?.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
      }
      markers.removeWhere((element) => element.markerId.value == "current");
      markers.add(Marker(
          markerId: MarkerId("current"),
          position: LatLng(position!.latitude, position.longitude)));
      update();
    });
  }

  refreshLocation() async {
    await Future.delayed(Duration(seconds: 2));

    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      FirebaseFirestore.instance
          .collection("delivery")
          .doc(ordersModel.ordersId.toString())
          .set({
        "lat": currentlat.toString(),
        "long": currentlong.toString(),
        "deliveryid": myServices.sharedPreferences.get("id").toString()
      });
    });
  }

  initPolyline() async {
    destlat = ordersModel.addressLat;
    destlong = ordersModel.addressLong;
    await Future.delayed(Duration(seconds: 1));

    polylineSet = await getPolyline(currentlat, currentlong, destlat, destlong);
    update();
  }

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments['ordersmodel'] != null) {
      ordersModel = Get.arguments['ordersmodel'];
      refreshLocation();
      getCurrentLocation();
      initPolyline();
    } else {
      // Handle the case when arguments are null or ordersmodel is not passed
      print("No ordersmodel argument passed");
    }
    super.onInit();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    gmc!.dispose();
    timer?.cancel();
    super.onClose();
  }
}
