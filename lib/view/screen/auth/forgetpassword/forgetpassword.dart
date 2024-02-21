import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetPassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custom_login_button.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backGroundColor,
          elevation: 0.0,
          title: Text('Forgot Password',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          Get.width * 0.09), // 9% of screen width
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Form(
                            key: controller.formState,
                            child: Column(
                              children: <Widget>[
                                const CustomTextTitleAuth(text: "Check Email"),
                                SizedBox(
                                    height: Get.height *
                                        0.05), // 5% of screen height
                                const CustomTextBodyAuth(
                                    text:
                                        "please Enter Your Email Address To Receive A verification code"),
                                SizedBox(height: Get.height * 0.08),
                                SizedBox(
                                    height: Get.height *
                                        0.02), // 2% of screen height
                                SizedBox(
                                  // width: Get.width * 0.85, // 80% of screen width
                                  // height: Get.height * 0.09,
                                  child: CustomTextFormAuth(
                                    keyboardType: TextInputType.emailAddress,
                                    myController: controller.email,
                                    labelText: "Email",
                                    prefixIcon: const Icon(Icons.email),
                                    valid: (val) {
                                      return validInput(val!, 5, 50, "email");
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height: Get.height *
                                        0.02), // 2% of screen height
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                  height:
                                      Get.height * 0.03), // 3% of screen height
                              CustomButtonLogin(
                                  buttonName: "Check",
                                  onPressed: () {
                                    controller.checkEmailForgetPassword();
                                  }),
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
