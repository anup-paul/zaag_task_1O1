import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaag_recruitment_task/src/themes/color_config.dart';
import 'package:zaag_recruitment_task/src/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConfig.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorConfig.backgroundColor,
          surfaceTintColor: Colors.transparent,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}