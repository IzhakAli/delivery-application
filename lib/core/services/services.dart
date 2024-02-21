import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_options.dart';

class MyServices {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    //start services
    sharedPreferences = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //end services
    return this;
  }

  Future<void> clearPreferencesExcept(
      String language_lang, String middleware_step) async {
    final keys = sharedPreferences.getKeys();

    for (String key in keys) {
      if (key != language_lang && key != middleware_step) {
        await sharedPreferences.remove(key);
      }
    }
  }
}

initialServices() async {
  await Get.putAsync(
    () => MyServices().init(),
  );
}
