import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/category_card_model.dart';
import 'package:news/repository/sources/repository/source_repo.dart';
import 'package:news/ui/home/category/cubit/source_state.dart';

class SourceViewModelCubit extends Cubit<SourceState> {
  SourceRepo sourceRepo;

  SourceViewModelCubit({required this.sourceRepo}) : super(LoadingState());

  void getSources(CategoryCardModel category) async {
    emit(LoadingState());
    try {
      var response = await sourceRepo.getSources(category);
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
