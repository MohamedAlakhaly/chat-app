import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//! application services

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

}
Future initialService()async {
    await Get.putAsync(() => AppServices().init());
}
