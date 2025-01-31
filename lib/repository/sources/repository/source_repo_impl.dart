import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category_card_model.dart';
import 'package:news/repository/sources/data%20source/source_remote_data_source.dart';
import 'package:news/repository/sources/repository/source_repo.dart';

class SourceRepoImpl implements SourceRepo {
  SourceRemoteDataSource sourceRemoteDataSource;

  SourceRepoImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourceResponse?> getSources(CategoryCardModel category) {
    return sourceRemoteDataSource.getSources(category);
  }
}
