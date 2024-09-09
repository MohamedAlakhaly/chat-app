import 'package:get/get.dart';

verifyInput(int max, int min, String val, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'not valid username';
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'not valid email';
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'not valid email';
    }
  }

    if (val.isEmpty) {
    return 'can not be empty';
  }

  if (val.length > max) {
    return 'can not be more than $max';
  }

  if (val.length < min) {
    return 'can not be less than $min';
  }
}
