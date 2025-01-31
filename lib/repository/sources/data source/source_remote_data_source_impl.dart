import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category_card_model.dart';
import 'package:news/repository/sources/data%20source/source_remote_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(CategoryCardModel category) async {
    var response = await apiManager.getSource(category);
    return response;
  }
}
