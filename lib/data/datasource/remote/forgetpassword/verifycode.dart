import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerifyCodeForgetPassData {
  Crud crud;
  VerifyCodeForgetPassData(this.crud);
  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCodeForgetPassword,
        {"email": email, "verifycode": verifyCode});
    return response.fold((l) => l, (r) => r);
  }
}
