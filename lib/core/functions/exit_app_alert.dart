import 'dart:async';

import 'package:get/get.dart';

Future<bool> showExitDialog() {
  Completer<bool> completer = Completer<bool>();

  Get.defaultDialog(
    title: 'Exit App',
    middleText: 'Do you want to exit the app?',
    textCancel: 'No',
    textConfirm: 'Yes',
    onCancel: () {
      Get.back(result: false); // return false when 'No' is pressed
      completer.complete(false);
    },
    onConfirm: () {
      Get.back(result: true); // return true when 'Yes' is pressed
      completer.complete(true);
    },
    barrierDismissible: true, // user must tap button to close dialog.
  );

  return completer.future;
}
