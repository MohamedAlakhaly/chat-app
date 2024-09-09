import 'package:chat_app/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBarProfileScreen extends StatelessWidget {
  final String? name;
  final String? email;
  final Function()? onTap;
  const CustomAppBarProfileScreen(
      {super.key, this.name, this.email, this.onTap});

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: AppColors.primaryColor,
      child: Stack(
        children: [
          Positioned(
            bottom: 70,
            right: -70,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: AppColors.textWhite.withOpacity(0.3),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            top: 70,
            right: -70,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  color: AppColors.textWhite.withOpacity(0.3),
                  shape: BoxShape.circle),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Account',
                        style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.textWhite,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$name',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          Text(
                            '$email',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: const Icon(
                        Iconsax.edit,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
