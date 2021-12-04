part of 'banners_cubit.dart';

abstract class BannersState extends Equatable {
  const BannersState();

  @override
  List<Object> get props => [];
}

class BannersInitial extends BannersState {}

class BannersLoaded extends BannersState {
  const BannersLoaded(this.list);
  final List<Widget> list;

  @override
  List<Object> get props => <Object>[list];
}

class BannersFailure extends BannersState {
  const BannersFailure(this.failure);
  final Failure failure;

  @override
  List<Object> get props => <Object>[failure];
}
