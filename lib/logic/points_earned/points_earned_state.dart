part of 'points_earned_cubit.dart';

abstract class PointsEarnedState extends Equatable {
  const PointsEarnedState();

  @override
  List<Object> get props => [];
}

class PointsEarnedInitial extends PointsEarnedState {}

class PointsEarnedLoaded extends PointsEarnedState {
  const PointsEarnedLoaded(this.pointsEarnedModel);
  final PointsEarnedModel pointsEarnedModel;

  @override
  List<Object> get props => <Object>[pointsEarnedModel];

  PointsEarnedLoaded copyWith({
    PointsEarnedModel? pointsEarnedModel,
  }) {
    return PointsEarnedLoaded(
      pointsEarnedModel ?? this.pointsEarnedModel,
    );
  }
}

class PointsEarnedFailure extends PointsEarnedState {
  const PointsEarnedFailure(this.failure);
  final Failure failure;

  @override
  List<Object> get props => <Object>[failure];
}
