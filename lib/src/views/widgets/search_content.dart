import 'package:flutter/material.dart';
import 'package:zaag_recruitment_task/src/controllers/user_controller.dart';
import 'package:zaag_recruitment_task/src/themes/color_config.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({
    super.key, required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => controller.searchQuery.value = value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        hintText: 'Search item here...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConfig.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConfig.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConfig.borderColor, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConfig.borderColor),
        ),
        suffixIcon:  Icon(Icons.search,color : ColorConfig.lightGreyColor),
      ),
    );
  }
}