import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/constant/app_images.dart';
import 'package:chat_app/modules/chat/view/chat_view.dart';
import 'package:chat_app/modules/search/controller/search_controller.getx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String searchBarValue = 'MOH_SKD_ALakh_44726';
  @override
  Widget build(BuildContext context) {
    SearchViewImp controller = Get.put(SearchViewImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125,
        title: TextFormField(
          onChanged: (val) {
            setState(
              () {
                if (val.isEmpty) {
                  searchBarValue = 'MOH_SKD_ALakh_44726';
                } else {
                  searchBarValue = val;
                }
              },
            );
          },
          decoration: InputDecoration(
            hintText: 'Enter username',
            label: const Text('Username'),
            labelStyle: const TextStyle(color: AppColors.textWhite),
            prefixIcon: const Icon(Iconsax.search_normal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.customSecondGrey.withOpacity(0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchBarValue == 'MOH_SKD_ALakh_44726'
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.searchImg),
                      const Text(
                        'Find your friends',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                : StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .orderBy('username')
                        .startAt([searchBarValue])
                        .endAt(['$searchBarValue\uf8ff'])
                        .where('username', isNotEqualTo: controller.myUsername)
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Text('Loading...'),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map data = snapshot.data!.docs[index].data() as Map;
                          return GestureDetector(
                            onTap: () {
                              Get.to(ChatView(
                                  receiver: data['username'],
                                  sender: controller.myUsername!));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: AppColors.primaryColor,
                                    child: Text(
                                      data['username']
                                          .substring(0, 1)
                                          .toUpperCase(),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${data['username']}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
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
