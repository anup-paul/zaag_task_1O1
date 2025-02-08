
import 'package:flutter/material.dart';
import 'package:zaag_recruitment_task/src/themes/color_config.dart';

class AppFloatingButton extends StatelessWidget {
  String? title;
  Function()? onTap;
  AppFloatingButton({
    super.key, this.title, this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: onTap,
            backgroundColor: ColorConfig.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorConfig.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}