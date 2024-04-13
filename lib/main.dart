import 'package:flutter/material.dart';
import 'package:flutter_burger_joy/screens/home_page.dart';
import 'package:flutter_burger_joy/utils/colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burger Joy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorPrimary,
          primary: colorPrimary,
          secondary: colorSecondary,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
