import 'dart:developer';
import 'package:chat_app/constant/app_routes.dart';
import 'package:chat_app/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  goToSignIn();
  createNewAccount();
}

class SignUpControllerImp extends SignUpController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AppServices services = Get.find();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  // bool isLoading = false;
  @override
  goToSignIn() {
    // Get.offAllNamed(AppRoutes.signIn);
  }

  CollectionReference userReference =
      FirebaseFirestore.instance.collection('users');

  @override
  createNewAccount() async {
    if (globalKey.currentState!.validate()) {
      try {
        await userReference.add({
          'firstName': firstName.text,
          'lastName': lastName.text,
          'username': username.text,
          'phone': phoneNumber.text,
          'email': email.text,
          'password': password.text,
        });
        addUsersDataToSharedPreferences();
        Get.offAllNamed(AppRoutes.homeView);
        log('successfully added');
      } catch (e) {
        log(e.toString());
      }
    }
  }

  addUsersDataToSharedPreferences() {
    services.sharedPreferences.setString('firstName', firstName.text);
    services.sharedPreferences.setString('lastName', lastName.text);
    services.sharedPreferences.setString('username', username.text);
    services.sharedPreferences.setString('phone', phoneNumber.text);
    services.sharedPreferences.setString('email', email.text);
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    username = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    username.dispose();
    phoneNumber.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
