import 'dart:developer';

import 'package:chat_app/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChatController extends GetxController {}

class ChatControllerImp extends ChatController {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('messages');
  AppServices services = Get.find();
  late TextEditingController messagesController;

  String? username;

  getUsername() {
    username = services.sharedPreferences.getString('username');
  }

  sendMessage({String? receiver, String? sender, DateTime? time}) async {
    await reference.add({
      'message': messagesController.text,
      'sender': sender,
      'receiver': receiver,
      'time': DateTime.now()
    });
    messagesController.clear();
  }

  @override
  void onInit() {
    messagesController = TextEditingController();
    getUsername();
    super.onInit();
  }

  @override
  void dispose() {
    messagesController.dispose();
    super.dispose();
  }
}
