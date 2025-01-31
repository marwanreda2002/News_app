import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';

import 'news_state.dart';

class NewsViewModelCubit extends Cubit<NewsState> {
  NewsViewModelCubit() : super(LoadingState());

  void getNewsBySourceId(String sourceId) async {
    emit(LoadingState());
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == "error") {
        emit(ErrorState(errorMsg: response!.message!));
      } else {
        emit(SuccessState(newsList: response!.articles!));
      }
    } catch (e) {
      emit(ErrorState(errorMsg: e.toString()));
    }
  }
}