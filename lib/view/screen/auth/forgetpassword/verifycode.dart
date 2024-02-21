import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/verifycode_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custom_login_button.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backGroundColor,
          elevation: 0.0,
          title: Text('Verification Code',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          Get.width * 0.05), // 5% of screen width
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: Get.height * 0.02),
                              const CustomTextTitleAuth(text: "Check code"),
                              SizedBox(
                                  height:
                                      Get.height * 0.02), // 2% of screen height
                              CustomTextBodyAuth(
                                  text:
                                      "Please Enter The Digit Code Sent To ${controller.email}"),
                              SizedBox(
                                  height:
                                      Get.height * 0.08), // 2% of screen height
                              SizedBox(
                                width: Get.width * 0.85, // 80% of screen width
                                height: Get.height * 0.09,
                                child: OtpTextField(
                                  enabledBorderColor: Colors.black12,
                                  keyboardType: TextInputType.number,
                                  fieldWidth: Get.width * 0.14,
                                  borderWidth: 2,
                                  borderRadius: BorderRadius.circular(25),
                                  numberOfFields: 5,
                                  borderColor: AppColor.grey,
                                  //set to true to show as box or false to show as dash
                                  showFieldAsBox: true,
                                  //runs when a code is typed in
                                  onCodeChanged: (String code) {
                                    //handle validation or checks here
                                  },
                                  onSubmit: (String verificationCode) {
                                    controller.checkCode(verificationCode);
                                  }, // end onSubmit
                                ),
                              ),
                              SizedBox(
                                  height:
                                      Get.height * 0.02), // 2% of screen height
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                  height:
                                      Get.height * 0.03), // 3% of screen height
                              CustomButtonLogin(
                                  buttonName: "Verify", onPressed: () {}),
                              SizedBox(
                                  height:
                                      Get.height * 0.05), // 2% of screen height
                              // const CustomTextGoogleLogin(),
                              SizedBox(height: Get.height * 0.02),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
