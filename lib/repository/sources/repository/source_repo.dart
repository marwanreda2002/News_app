// TODO: interface
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category_card_model.dart';

abstract class SourceRepo {
  Future<SourceResponse?> getSources(CategoryCardModel category);
}
