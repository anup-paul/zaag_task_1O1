import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaag_recruitment_task/src/themes/color_config.dart';
import 'package:zaag_recruitment_task/src/views/widgets/search_content.dart';
import '../controllers/user_controller.dart';
import 'widgets/user_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        shadowColor : ColorConfig.borderColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: InkWell( onTap: () => Get.back(), child: Icon(Icons.arrow_back_ios, size: 20,)),
        ),
        centerTitle: true,
        title: Text('Search', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorConfig.primaryColor)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            children: [
              SearchContent(controller: controller),
              SizedBox(height: 16,),
              Obx(() {
                if (controller.filteredList.isEmpty) {
                  return const Center(child: Text('No users found'));
                }
                return RefreshIndicator(
                  onRefresh: () async => controller.fetchUsers(isRefresh: true),
                  child: ListView.builder(
                    itemCount: controller.filteredList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return UserCard(user: controller.filteredList[index]);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}