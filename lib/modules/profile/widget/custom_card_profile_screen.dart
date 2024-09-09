import 'package:chat_app/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCardProfileScreen extends StatelessWidget {
  final String cartTitle;
  final String cartSubTitle;
  final IconData cardIcon;
  final void Function()? onTap;
  const CustomCardProfileScreen({
    super.key,
    required this.cartTitle,
    required this.cartSubTitle,
    required this.cardIcon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.customGrey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              cardIcon,
              size: 32,
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900,color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    cartSubTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
