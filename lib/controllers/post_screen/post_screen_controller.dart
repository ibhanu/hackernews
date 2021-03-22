import 'package:get/get.dart';
import 'package:hackernews/modals/post_screen/post_screen_modal.dart';
import 'package:hackernews/services/network_helper.dart';

class PostViewController extends GetxController {
  final String objectID;
  PostViewController({this.objectID});

  var isLoading = true.obs;
  var postViewDataList = PostViewModal().obs;

  getPostData() async {
    var postViewData = await NetworkHelper.getPostData(objectID: objectID);
    postViewDataList.value = postViewData;
    isLoading(false);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getPostData();
    super.onInit();
  }
}
