import 'package:chat_app/modules/profile/controller/profile_screen_controller.getx.dart';
import 'package:chat_app/modules/profile/widget/custom_app_bar_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileScreenControllerImp controller =
        Get.put(ProfileScreenControllerImp());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<ProfileScreenControllerImp>(builder: (myController) {
              return CustomAppBarProfileScreen(
                name: '${controller.firstName} ${controller.lastName}',
                email: controller.email,
                onTap: () {
                  // Get.toNamed(AppRoutes.editProfile);
                },
              );
            }),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Text(
            //     'Account Settings',
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w900,
            //       color: Theme.of(context).colorScheme.primary,
            //     ),
            //   ),
            // ),
            // CustomCardProfileScreen(
            //   onTap: controller.goToMyAccount,
            //   cardIcon: Iconsax.home_14,
            //   cartTitle: 'My Account',
            //   cartSubTitle: 'Set shopping delivery address',
            // ),
            // CustomCardProfileScreen(
            //   onTap: controller.goToCartScreen,
            //   cardIcon: Iconsax.shopping_cart,
            //   cartTitle: 'My Cart',
            //   cartSubTitle: 'add ,remove product and move to checkout',
            // ),
            // CustomCardProfileScreen(
            //   onTap: controller.goToMyOrder,
            //   cardIcon: Iconsax.component,
            //   cartTitle: 'My Order',
            //   cartSubTitle: 'progress and completed order',
            // ),
            // const CustomCardProfileScreen(
            //   cardIcon: Iconsax.bank,
            //   cartTitle: 'Bank Account',
            //   cartSubTitle: 'withdraw balance to registered bank account',
            // ),
            // const CustomCardProfileScreen(
            //   cardIcon: Iconsax.cloud_plus,
            //   cartTitle: 'My Coupons',
            //   cartSubTitle: 'List of all discounts coupons',
            // ),
            // const CustomCardProfileScreen(
            //   cardIcon: Iconsax.notification,
            //   cartTitle: 'Notification',
            //   cartSubTitle: 'Set any kind of notification message',
            // ),
            // const CustomCardProfileScreen(
            //   cardIcon: Iconsax.security_safe,
            //   cartTitle: 'Account privacy',
            //   cartSubTitle: 'Manage data usage and connected accounts',
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Text(
            //     'App Settings',
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w900,
            //       color: Theme.of(context).colorScheme.primary,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
