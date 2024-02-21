import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(
      String username, String password, String email, String number) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": number,
    });
    return response.fold((l) => l, (r) => r);
  }
}
