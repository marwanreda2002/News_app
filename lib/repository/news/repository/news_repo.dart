import 'package:news/model/NewsResponse.dart';

abstract class NewsRepo {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
