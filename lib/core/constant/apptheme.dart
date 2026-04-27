import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
        fontFamily: "playfairDisplay",
        textTheme: TextTheme( 
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.black,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: AppColor.black,
          ),
          bodyLarge: TextStyle(height: 2, color: AppColor.grey, fontSize: 15),
          bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 12),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      );

ThemeData themeArabic = ThemeData(
        fontFamily: "Cario",
        textTheme: TextTheme( 
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.black,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: AppColor.black,
          ),
          bodyLarge: TextStyle(height: 2, color: AppColor.grey, fontSize: 15),
          bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 12),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      );