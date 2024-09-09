import 'package:chat_app/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// abstract class HomeController extends GetxController {}

class SearchViewImp extends GetxController {
  late TextEditingController searchController;
  AppServices services = Get.find();
  String? myUsername;
  getUsername() {
    myUsername = services.sharedPreferences.getString('username');
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    getUsername();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // goToChatView({String? username,String?sender}) {
  //   Get.to(() => ChatView(
  //         username: username!,
  //         sender: sender!,
  //       ));
  // }
}
