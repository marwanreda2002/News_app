import 'package:news/model/NewsResponse.dart';

abstract class NewsState {}

class LoadingState extends NewsState {}

class ErrorState extends NewsState {
  String errorMsg;

  ErrorState({required this.errorMsg});
}

class SuccessState extends NewsState {
  List<News> newsList;

  SuccessState({required this.newsList});
}
