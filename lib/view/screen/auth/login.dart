import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/functions/exit_app_alert.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custom_login_button.dart';
import '../../widget/auth/custom_login_reset_password.dart';
import '../../widget/auth/customtextformauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return WillPopScope(
      onWillPop: () async {
        return await showExitDialog();
      },
      child: GetBuilder<LoginControllerImp>(
        builder: (controller) {
          return Scaffold(
            body: HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Center(
                child: SingleChildScrollView(
                  // Changed to SingleChildScrollView to accommodate different screen sizes
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.2, // Adjust the size accordingly
                        child: Center(
                          child: ClipOval(
                            child: Image.asset(
                              AppImageAsset.logo,
                              fit: BoxFit.cover,
                              width: Get.width *
                                  0.3, // Adjust the size accordingly
                              height: Get.width *
                                  0.3, // Adjust the size accordingly
                            ),
                          ),
                        ),
                      ),
                      Text("eGIFT Delivery Boy App",
                          style: TextStyle(
                              color: AppColor.secondary, fontSize: 24)),
                      Padding(
                        padding: EdgeInsets.all(
                            Get.width * 0.05), // 5% of screen width
                        child: Form(
                          key: controller.formState,
                          child: Column(
                            children: <Widget>[
                              CustomTextFormAuth(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                myController: controller.email,
                                labelText: "Email",
                                prefixIcon: const Icon(Icons.email),
                                valid: (val) =>
                                    validInput(val!, 5, 100, "email"),
                              ),
                              SizedBox(
                                  height:
                                      Get.height * 0.02), // 2% of screen height
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => CustomTextFormAuth(
                                  textInputAction: TextInputAction.done,
                                  suffixIcon: IconButton(
                                    onPressed: controller.showPassword,
                                    icon: Icon(
                                      controller.isShowPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  obscureText: controller.isShowPassword,
                                  myController: controller.password,
                                  labelText: "Password",
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  valid: (val) =>
                                      validInput(val!, 6, 40, "password"),
                                ),
                              ),
                              CustomResetPasswordTextLogin(
                                  onPressed: controller.goToForgetPassword),
                              SizedBox(
                                  height:
                                      Get.height * 0.03), // 3% of screen height
                              CustomButtonLogin(
                                buttonName: "Login",
                                onPressed: controller.login,
                              ),
                              SizedBox(
                                  height:
                                      Get.height * 0.05), // 5% of screen height
                              // CustomNavigatorBetweenAuthPages(
                              //   text: 'Don\'t have an account? Sign Up',
                              //   onPressed: controller.goToSignUp,
                              // ),
                              SizedBox(height: Get.height * 0.02),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
