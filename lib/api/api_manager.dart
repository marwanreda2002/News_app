import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=3777cabecf3f4533b64010f6349070b3
class ApiManager {
  static Future<SourceResponse?> getSource() async {
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.sourceApi, {
      "apiKey": ApiConstant.apiKey,
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=3777cabecf3f4533b64010f6349070b3
  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
    Uri url=Uri.https(ApiConstant.baseUrl,EndPoints.newsApi,{
      "apiKey":ApiConstant.apiKey,
      "sources":sourceId
    });
    try {
      var response=await http.get(url);

      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }


}
