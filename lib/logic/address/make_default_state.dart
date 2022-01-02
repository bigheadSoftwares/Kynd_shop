part of 'make_default_cubit.dart';

abstract class MakeDefaultState extends Equatable {
  const MakeDefaultState();

  @override
  List<Object> get props => <Object>[];
}

class MakeDefaultInitial extends MakeDefaultState {}

class MakeDefaultLoading extends MakeDefaultState {}

class MakeDefaultLoaded extends MakeDefaultState {}

class MakeDefaultFailure extends MakeDefaultState {
  final Failure failure;

  const MakeDefaultFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
