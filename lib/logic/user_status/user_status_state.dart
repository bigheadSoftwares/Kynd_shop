part of 'user_status_cubit.dart';

abstract class UserStatusState extends Equatable {
  const UserStatusState();

  @override
  List<Object> get props => [];
}

class UserStatusInitial extends UserStatusState {}

class UserStatusLoaded extends UserStatusState {
  final UserStatusData userData;

  const UserStatusLoaded(this.userData);
  @override
  List<Object> get props => <Object>[userData];
}

class UserStatusFailure extends UserStatusState {
  final bighead.Failure failure;

  const UserStatusFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
