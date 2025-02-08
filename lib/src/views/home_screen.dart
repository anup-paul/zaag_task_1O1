import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaag_recruitment_task/src/themes/color_config.dart';
import 'package:zaag_recruitment_task/src/views/widgets/app_floating_button.dart';
import 'package:zaag_recruitment_task/src/views/widgets/user_card.dart';
import '../controllers/user_controller.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.backgroundColor,
        title: Text('Hello, Welcome back', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorConfig.primaryColor)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Image.asset("assets/images/welcome.png", width: 28, height: 28,),
          )
        ],
      ),
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return Center(
            child: Text(
              'No items to show now.\nPlease add some favorite items to see here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorConfig.lightGreyColor, fontSize:16, fontWeight: FontWeight.w500 ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("Favorite Items", style: TextStyle(color: ColorConfig.primaryColor,fontSize: 18, fontWeight:  FontWeight.w600, ),),
                  ),
                  ListView.builder(
                    itemCount: controller.favoriteList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return UserCard(user: controller.favoriteList[index]);
                    },
                  ),
                  SizedBox(height: 80,)
                ],
              ),
            ),
          );
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppFloatingButton(
        title: "Add Favorite Item",
        onTap: () => Get.to(() => const SearchScreen()),
      ),
    );
  }
}