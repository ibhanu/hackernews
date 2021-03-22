import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackernews/views/home_screen/home_screen_view.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenView(),
    );
  }
}
