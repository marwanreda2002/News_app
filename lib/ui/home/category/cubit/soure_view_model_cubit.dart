import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/category_card_model.dart';
import 'package:news/ui/home/category/cubit/source_state.dart';

class SourceViewModelCubit extends Cubit<SourceState> {
  SourceViewModelCubit() : super(LoadingState());

  void getSources(CategoryCardModel category) async {
    emit(LoadingState());
    try {
      var response = await ApiManager.getSource(category);
      if (response?.status == "error") {
        emit(ErrorState(errorMsg: response!.message!));
      } else {
        emit(SuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      emit(ErrorState(errorMsg: e.toString()));
    }
  }
}
