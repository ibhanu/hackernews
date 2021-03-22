import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackernews/controllers/home_screen/home_screen_controller.dart';
import 'package:hackernews/views/post_screen/post_screen_view.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

Widget buildFloatingSearchBar(
    BuildContext context, HomeScreenController homeScreenController) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  return FloatingSearchBar(
    closeOnBackdropTap: true,
    clearQueryOnClose: true,
    hint: 'Search for HackerNews',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 500),
    transitionCurve: Curves.easeInOut,
    backgroundColor: Colors.white,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    progress: true,
    width: isPortrait ? 600 : 500,
    debounceDelay: const Duration(milliseconds: 500),
    onQueryChanged: (query) {
      homeScreenController.onQueryChanged(query);
      homeScreenController.update();
    },
    automaticallyImplyBackButton: true,
    actions: [],
    transition: CircularFloatingSearchBarTransition(),
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: (homeScreenController.homeViewDataList.value.hits != null)
                ? Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      for (var post
                          in homeScreenController.homeViewDataList.value.hits)
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PostScreenView(
                                  objectID: post.objectId,
                                ));
                          },
                          child: Container(
                            height: 60.0,
                            width: Get.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  post.title,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        )
                    ]),
                  )
                : Container(
                    height: Get.height / 1.40,
                    child: Center(
                      child: Text('Quite Empty Here'),
                    ),
                  )),
      );
    },
  );
}
