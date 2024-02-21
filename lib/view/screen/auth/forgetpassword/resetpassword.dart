import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custom_login_button.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backGroundColor,
          elevation: 0.0,
          title: Text('Reset Password',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          Get.width * 0.05), // 5% of screen width
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Form(
                              key: controller.formState,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                      height: Get.height *
                                          0.02), // 2% of screen height
                                  const CustomTextTitleAuth(
                                      text: "New password"),
                                  SizedBox(
                                      height: Get.height *
                                          0.04), // 2% of screen height
                                  const CustomTextBodyAuth(
                                      text: "Please Enter your new password"),
                                  SizedBox(
                                      // width: Get.width * 0.85, // 80% of screen width
                                      // height: Get.height * 0.09,
                                      child: GetBuilder<
                                          ResetPasswordControllerImp>(
                                    builder: (controller) => CustomTextFormAuth(
                                      textInputAction: TextInputAction.next,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.showPassword();
                                          },
                                          icon: Icon(
                                            controller.isShowPassword == true
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          )),
                                      obscureText: controller.isShowPassword,
                                      myController: controller.password,
                                      labelText: "Password",
                                      prefixIcon: const Icon(Icons.password),
                                      valid: (val) {
                                        return validInput(
                                            val!, 6, 50, "password");
                                      },
                                    ),
                                  )),
                                  SizedBox(height: Get.height * 0.02),
                                  SizedBox(
                                      // width: Get.width * 0.85, // 80% of screen width
                                      // height: Get.height * 0.09,
                                      child: GetBuilder<
                                          ResetPasswordControllerImp>(
                                    builder: (controller) => CustomTextFormAuth(
                                      textInputAction: TextInputAction.done,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.showPassword();
                                          },
                                          icon: Icon(
                                            controller.isShowPassword == true
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          )),
                                      obscureText: controller.isShowPassword,
                                      myController: controller.rePassword,
                                      labelText: "Retype Password",
                                      prefixIcon: const Icon(Icons.password),
                                      valid: (val) {
                                        return validInput(
                                            val!, 6, 50, "password");
                                      },
                                    ),
                                  )),
                                  SizedBox(
                                      height: Get.height *
                                          0.02), // 2% of screen height
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                    height: Get.height *
                                        0.03), // 3% of screen height
                                CustomButtonLogin(
                                    buttonName: "Reset",
                                    onPressed: () {
                                      controller.resetPassword();
                                    }),
                                SizedBox(
                                    height: Get.height *
                                        0.05), // 2% of screen height
                                // const CustomTextGoogleLogin(),
                                SizedBox(height: Get.height * 0.02),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
