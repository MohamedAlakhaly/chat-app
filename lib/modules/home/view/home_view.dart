import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/modules/chat/view/chat_view.dart';
import 'package:chat_app/modules/home/controller/home_controller.getx.dart';
import 'package:chat_app/modules/profile/view/profile_screen.dart';
import 'package:chat_app/modules/search/view/search_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
            color: AppColors.primaryColor, shape: BoxShape.circle),
        child: GestureDetector(
          onTap: () {
            Get.to(() => const SearchView());
          },
          child: const Icon(Iconsax.message),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Hello ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: controller.username,
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileScreen(),transition: Transition.circularReveal);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Text(controller.username.substring(0, 1).toUpperCase()),
              ),
            )
          ],
        ),
      ),
      //todo najma
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('receiver')
                  .where('receiver', isEqualTo: controller.username)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Map data = snapshot.data!.docs[index].data() as Map;
                    String sender = data['sender'];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ChatView(
                            receiver: data['sender'],
                            sender: controller.username,
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.primaryColor,
                              child: Text(sender.substring(0, 1).toUpperCase()),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              sender,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
