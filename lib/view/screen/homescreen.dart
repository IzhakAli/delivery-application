import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screen_controller.dart';
import '../../core/functions/exit_app_alert.dart';
import '../widget/home/custombuttonappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: Text("Orders"),
            ),
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: WillPopScope(
                onWillPop: () async {
                  return await showExitDialog();
                },
                child: controller.listPage.elementAt(controller.currentpage))));
  }
}
