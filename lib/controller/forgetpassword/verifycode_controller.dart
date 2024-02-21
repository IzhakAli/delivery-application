import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verificationCode);
  // goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  //backend stuff
  VerifyCodeForgetPassData verifyCodeForgetPassData =
      VerifyCodeForgetPassData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
//end of back end

  @override
  checkCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPassData.postData(email!, verificationCode);
    print("===============================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Incorrect",
            middleText: "The verification code entered is not correct!");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
