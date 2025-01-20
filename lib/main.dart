import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_dice/utils/colors.dart';
import 'routes.dart'; // Import your routes file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Touch Dice',
      initialRoute: '/First-Page', // Set the default route
      getPages: Routes.routes, // Pass the routes defined in Routes class
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor, // App background color
        cardColor: kCardBackgroundColor, // Card background color
        primaryColor: kAccentColorGreen, // Primary app color
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: kPrimaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold), // Updated style name
          bodyLarge: TextStyle(
              color: kSecondaryTextColor, fontSize: 16), // Updated style name
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kCardBackgroundColor, // AppBar background color
          titleTextStyle: TextStyle(
            color: kPrimaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ), // Title color
          iconTheme: IconThemeData(color: kPrimaryTextColor), // Icon color
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: kAccentColorGreen, // Default button color
          textTheme: ButtonTextTheme.primary, // Text color inside buttons
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kAccentColorGreen, // Green button
            foregroundColor: kPrimaryTextColor, // White text
          ),
        ),
        iconTheme: const IconThemeData(
          color: kPrimaryTextColor, // Default icon color
        ),
      ),
    );
  }
}
