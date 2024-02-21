import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';
import '../widget/language/custombuttonlang.dart';

class MyLanguage extends GetView<LocaleController> {
  const MyLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${"1".tr}:", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 30,
            ),
            CustomButtonLanguage(
              $buttonName: 'English',
              onPressed: () {
                controller.changeLang("en");
                controller.gotoLogin();
                Get.toNamed(AppRoute.login);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButtonLanguage(
                $buttonName: 'Arabic',
                onPressed: () {
                  controller.changeLang("ar");
                  controller.gotoLogin();
                  Get.toNamed(AppRoute.login);
                })
          ],
        ),
      ),
    );
  }
}
