part of 'points_earned_cubit.dart';

abstract class PointsEarnedState extends Equatable {
  const PointsEarnedState();

  @override
  List<Object> get props => [];
}

class PointsEarnedInitial extends PointsEarnedState {}

class PointsEarnedLoaded extends PointsEarnedState {
  const PointsEarnedLoaded(this.pointsEarnedModel, this.totalPoints);
  final PointsEarnedModel pointsEarnedModel;
  final double totalPoints;

  @override
  List<Object> get props => <Object>[pointsEarnedModel, totalPoints];

  PointsEarnedLoaded copyWith({
    PointsEarnedModel? pointsEarnedModel,
    double? totalPoints,
  }) {
    return PointsEarnedLoaded(
      pointsEarnedModel ?? this.pointsEarnedModel,
      totalPoints ?? this.totalPoints,
    );
  }
}

class PointsEarnedFailure extends PointsEarnedState {
  const PointsEarnedFailure(this.failure);
  final Failure failure;

  @override
  List<Object> get props => <Object>[failure];
}
