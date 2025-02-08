import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaag_recruitment_task/src/models/user_list_model.dart';
import 'package:zaag_recruitment_task/src/themes/color_config.dart';
import '../../controllers/user_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';


class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorConfig.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    height: 48, width: 48, fit: BoxFit.cover, imageUrl: user.avatar ?? "",
                    placeholder: (context, url) => Center(child: Icon(Icons.person_2_outlined)),
                    errorWidget: (context, url, error) => Icon(Icons.person_2_outlined),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name :",
                        style: TextStyle(fontSize: 14, color: ColorConfig.lightGreyColor),),
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: TextStyle(fontSize: 16, color: ColorConfig.primaryColor),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Email Address :",
                        style: TextStyle(fontSize: 14, color: ColorConfig.lightGreyColor),
                      ),
                      Text(
                        "${user.email}",
                        style: TextStyle(fontSize: 16, color: ColorConfig.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(() => IconButton(
            icon: Icon(
              size: 24,
              controller.favoriteList.contains(user)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: controller.favoriteList.contains(user)
                  ? Colors.red
                  : ColorConfig.lightGreyColor,
            ),
            onPressed: () => controller.toggleFavorite(user),
          )),
        ],
      ),
    );
  }
}