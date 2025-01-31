import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repository/news/repository/news_repo.dart';
import 'news_state.dart';

class NewsViewModelCubit extends Cubit<NewsState> {
  NewsRepo newsRepo;

  NewsViewModelCubit({required this.newsRepo}) : super(LoadingState());

  void getNewsBySourceId(String sourceId) async {
    emit(LoadingState());
    try {
      var response = await newsRepo.getNewsBySourceId(sourceId);
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