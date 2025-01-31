import 'package:news/repository/sources/data%20source/source_remote_data_source.dart';

import '../api/api_manager.dart';
import '../repository/news/data source/news_remote_data_source.dart';
import '../repository/news/data source/news_remote_data_source_impl.dart';
import '../repository/news/repository/news_repo.dart';
import '../repository/news/repository/news_repo_impl.dart';
import '../repository/sources/data source/source_remote_data_source_impl.dart';
import '../repository/sources/repository/source_repo.dart';
import '../repository/sources/repository/source_repo_impl.dart';

class Di {
  static ApiManager injectApiManager() {
    return ApiManager();
  }

  static NewsRemoteDataSource injectNewsRemoteDataSource() {
    return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
  }

  static NewsRepo injectNewsRepo() {
    return NewsRepoImpl(newsRemoteDataSource: injectNewsRemoteDataSource());
  }

  static SourceRemoteDataSource injectSourceRemoteDataSource() {
    return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
  }

  static SourceRepo injectSourceRepo() {
    return SourceRepoImpl(
        sourceRemoteDataSource: injectSourceRemoteDataSource());
  }
}
