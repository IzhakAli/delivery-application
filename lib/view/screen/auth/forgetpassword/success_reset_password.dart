import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/success_resetpassword_controller.dart';
import '../../../widget/auth/custom_login_button.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controllerImp =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success"),
        centerTitle: true,
      ),
      body: (Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle,
                size: 150,
                color: Colors.green,
              ),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Text("Password Updated, tap on continue to login again",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            SizedBox(
              height: Get.height * 0.26,
            ),
            CustomButtonLogin(
              buttonName: "Proceed to Login",
              onPressed: () {
                controllerImp.goToLogin();
              },
            )
          ],
        ),
      )),
    );
  }
}
