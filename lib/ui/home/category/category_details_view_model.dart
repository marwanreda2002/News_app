import 'package:flutter/cupertino.dart';
import 'package:news/api/api_manager.dart';

import '../../../model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  // todo: hold data - handel logic

  String? errorMsg;
  List<Source>? sourcesList;

  void getSources(String categoryId) async {
    errorMsg = null;
    sourcesList = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSource(categoryId);
      if (response?.status == "error") {
        errorMsg = response!.message!;
      } else {
        sourcesList = response!.sources!;
      }
    } catch (e) {
      errorMsg = e.toString();
    }
    notifyListeners();
  }
}
