import 'package:delivery/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/binding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'eDelivery',
      locale: controller.appLanguage,
      theme: controller.appTheme,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}
