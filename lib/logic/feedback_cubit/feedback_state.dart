part of 'feedback_cubit.dart';

abstract class FeedbackState extends Equatable {
  const FeedbackState();

  @override
  List<Object> get props => <Object>[];
}

class FeedbackInitial extends FeedbackState {}

class FeedbackLoading extends FeedbackState {}

class FeedbackLoaded extends FeedbackState {}

class FeedbackFailure extends FeedbackState {
  final Failure failure;

  const FeedbackFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
