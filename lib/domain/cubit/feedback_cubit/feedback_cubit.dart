import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrching/domain/cubit/feedback_cubit/feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit(FeedbackState initialState) : super(initialState);
  final FeedbackState _feedbackState = FeedbackState();

  void setAppeal(String appeal) async {
    emit(_feedbackState.copyWith(appeal: appeal));
  }

  void setName(String username) async {
    emit(_feedbackState.copyWith(username: username));
  }
}
