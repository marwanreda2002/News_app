import 'package:flutter/cupertino.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMsg;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMsg = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == "error") {
        errorMsg = response!.message!;
      } else {
        newsList = response!.articles!;
      }
    } catch (e) {
      errorMsg = e.toString();
    }
    notifyListeners();
  }
}
