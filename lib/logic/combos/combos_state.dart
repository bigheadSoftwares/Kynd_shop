part of 'combos_cubit.dart';

abstract class CombosState extends Equatable {
  const CombosState();

  @override
  List<Object> get props => <Object>[];
}

class CombosInitial extends CombosState {}

class CombosLoaded extends CombosState {
  const CombosLoaded(this.combosModel);
  final CombosModel combosModel;

  @override
  List<Object> get props => <Object>[CombosModel];
}

class CombosFailure extends CombosState {
  const CombosFailure(this.failure);
  final Failure failure;

  @override
  List<Object> get props => <Object>[failure];
}
