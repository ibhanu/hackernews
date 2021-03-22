import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hackernews/controllers/post_screen/post_screen_controller.dart';
import 'package:html/parser.dart' show parse;

class PostScreenView extends StatelessWidget {
  final String objectID;
  PostScreenView({this.objectID});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE2EAD8),
        appBar: AppBar(
          title: Text('Post Screen'),
          centerTitle: true,
        ),
        body: GetBuilder<PostViewController>(
            init: PostViewController(objectID: objectID),
            builder: (postViewController) {
              return SingleChildScrollView(
                child: (postViewController.isLoading.value)
                    ? Container(
                        height: Get.height / 1.24,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Title',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    Text(
                                      postViewController
                                          .postViewDataList.value.title,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'POINTS',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          postViewController
                                              .postViewDataList.value.points
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.blue,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'comments',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          'Total (${postViewController.postViewDataList.value.children.length})',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      for (var comment in postViewController
                                          .postViewDataList.value.children)
                                        ListTile(
                                          title:
                                              Html(data: comment.text) ?? 'NA',
                                        )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
              );
            }),
      ),
    );
  }
}
