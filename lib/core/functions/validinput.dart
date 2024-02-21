import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Can't be empty";
  }
  if (val.length < min) {
    return "Can't be less than $min characters";
  }

  if (val.length > max) {
    return "Can't be more than $max characters";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Username not valid";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Email not valid";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Phone number not valid";
    }
  }
}
