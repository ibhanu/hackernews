import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackernews/controllers/home_screen/home_screen_controller.dart';
import 'package:hackernews/views/home_screen/widgets/search_bar.dart';

class HomeScreenView extends StatefulWidget {
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (_homeScreenController) {
          return SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('Home Screen'),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: Get.height / 1.24,
                          width: Get.width,
                          child: buildFloatingSearchBar(
                              context, _homeScreenController),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
