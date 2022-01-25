import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kynd_shop/utils/export_utilities.dart';
import '../../data/feedback/feedback_data_provider.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit() : super(FeedbackInitial());
  void sendFeedbck({required int rating, required String feedback}) {
    emit(FeedbackLoading());
    FeedBackDataProvider.sendFeedback(rating: rating, feedback: feedback).then(
      (bool value) {
        if (value) {
          emit(FeedbackLoaded());
        } else {
          emit(const FeedbackFailure(Failure(message: 'Something went wrong')));
        }
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          FeedbackFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
