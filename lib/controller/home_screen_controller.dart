import 'package:delivery/view/screen/orders/accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../view/screen/orders/pending.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    OrdersAccepted(),
    // Text("data")
  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.pending},
    {"title": "Accepted", "icon": Icons.check_box_rounded},
    // {"title": "Settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
