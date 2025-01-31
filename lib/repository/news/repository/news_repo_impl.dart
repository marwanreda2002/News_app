import 'package:news/model/NewsResponse.dart';
import 'package:news/repository/news/repository/news_repo.dart';

import '../data source/news_remote_data_source.dart';

class NewsRepoImpl implements NewsRepo {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepoImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return newsRemoteDataSource.getNewsBySourceId(sourceId);
  }
}
