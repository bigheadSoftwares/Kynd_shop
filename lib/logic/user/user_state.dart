part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => <Object>[];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  const UserSuccess({required this.user});
  final UserModel user;
  
  @override
  List<Object> get props => <UserModel>[];
}

class UserFailure extends UserState {
  const UserFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
