import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../utils/export_utilities.dart';
import '../../data/points_earned/points_earned_model/datum.dart';
import '../../data/points_earned/points_earned_data_provider.dart';
import '../../data/points_earned/points_earned_model/points_earned_model.dart';

part 'points_earned_state.dart';

class PointsEarnedCubit extends Cubit<PointsEarnedState> {
  PointsEarnedCubit() : super(PointsEarnedInitial());
  double totalPoints = 0;
  void pointsEarned() {
    emit(PointsEarnedInitial());
    PointsEarnedRepo.pointsEarned().then(
      (PointsEarnedModel pointsEarnedModel) {
        for (Datum point in pointsEarnedModel.data!) {
          totalPoints = totalPoints +
              (double.parse(
                point.points!,
              ));
        }
        emit(
          PointsEarnedLoaded(pointsEarnedModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          PointsEarnedFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
