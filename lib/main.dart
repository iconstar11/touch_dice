import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart'; // Import your routes file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Touch Dice',
      initialRoute: '/First-Page', // Set the default route
      getPages: Routes.routes, // Pass the routes defined in Routes class
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
