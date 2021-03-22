import 'package:get/get.dart';
import 'package:hackernews/modals/home_screen/home_screen_modal.dart';
import 'package:hackernews/services/network_helper.dart';

class HomeScreenController extends GetxController {
  var homeViewDataList = HomeViewModal().obs;

  onQueryChanged(String query) async {
    try {
      var homeViewData = await NetworkHelper.getSearchResultsData(query: query);
      homeViewDataList.value = homeViewData;
      update();
    } on Exception catch (e) {
      print('Error in QueryChanged:\n$e');
    }
  }
}
