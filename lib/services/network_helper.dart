import 'package:hackernews/constants.dart';
import 'package:hackernews/modals/home_screen/home_screen_modal.dart';
import 'package:hackernews/modals/post_screen/post_screen_modal.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<HomeViewModal> getSearchResultsData({String query}) async {
    try {
      var url = Uri.parse('$host/search?query=$query');
      var response = await http.get(url);
      String jsonString = response.body;
      print('Response from $url:\n$jsonString');
      return homeViewModalFromJson(jsonString);
    } on Exception catch (e) {
      print('Exception $e');
    }
  }

  static Future<PostViewModal> getPostData({String objectID}) async {
    try {
      var url = Uri.parse('$host/items/$objectID');
      var response = await http.get(url);
      String jsonString = response.body;
      print('Response from $url:\n$jsonString');
      return postViewModalFromJson(jsonString);
    } on Exception catch (e) {
      print('Exception $e');
    }
  }
}
