import 'package:chat_app/services/services.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  AppServices services = Get.find();
  late String username;

  getUserInfo() async {
    username = services.sharedPreferences.getString('username') ?? 'a';
  }

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }
}
