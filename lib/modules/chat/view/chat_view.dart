import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/modules/chat/controller/chat_controller.getx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChatView extends StatelessWidget {
  final String receiver;
  final String sender;
  const ChatView({
    super.key,
    required this.receiver,
    required this.sender,
  });

  @override
  Widget build(BuildContext context) {
    ChatControllerImp controller = Get.put(ChatControllerImp());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller.messagesController,
            decoration: InputDecoration(
              hintText: 'Message',
              prefixIcon: const Icon(Iconsax.message),
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.sendMessage(
                      sender: controller.username, receiver: receiver);
                },
                child: const Icon(
                  Iconsax.send1,
                  size: 32,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(receiver),
            ),
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Text(receiver.substring(0, 1).toUpperCase()),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: double.infinity, height: 20),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('time')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularPercentIndicator(radius: 50),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Map data = snapshot.data!.docs[index].data() as Map;
                    var resived = snapshot.data!.docs[index]['receiver'];
                    var senderUser = snapshot.data!.docs[index]['sender'];
                    return Container(
                      alignment: resived != receiver
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: resived != receiver
                            ? const EdgeInsets.only(
                                top: 15, right: 10, left: 30)
                            : const EdgeInsets.only(
                                top: 15, right: 30, left: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: resived != receiver
                              ? AppColors.customGrey.withOpacity(0.2)
                              : AppColors.primaryColor,
                          borderRadius: resived != receiver
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                )
                              : const BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                        ),
                        //? najma == najma and mohamed == mohamed
                        child: resived == receiver && senderUser == sender ||
                                //! najma == mohamed and re
                                receiver == senderUser && resived == sender
                            ? Text(
                                data['message'],
                                style: const TextStyle(fontSize: 17),
                              )
                            : const SizedBox(),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
