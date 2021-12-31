part of 'create_address_cubit.dart';

abstract class CreateAddressState extends Equatable {
  const CreateAddressState();

  @override
  List<Object> get props => <Object>[];
}

class CreateAddressInitial extends CreateAddressState {}

class CreateAddressLoading extends CreateAddressState {}

class CreateAddressLoaded extends CreateAddressState {}

class CreateAddressFailure extends CreateAddressState {
  final Failure failure;

  const CreateAddressFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
