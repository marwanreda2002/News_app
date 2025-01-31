import '../../../../model/SourceResponse.dart';

abstract class SourceState {}

class LoadingState extends SourceState {}

class ErrorState extends SourceState {
  String errorMsg;

  ErrorState({required this.errorMsg});
}

class SuccessState extends SourceState {
  List<Source> sourcesList;

  SuccessState({required this.sourcesList});
}
