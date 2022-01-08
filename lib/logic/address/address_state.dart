part of 'address_cubit.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => <Object>[];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final MyAddressesModel myAddressesModel;
  const AddressLoaded(this.myAddressesModel);
  @override
  List<Object> get props => <Object>[myAddressesModel];
}

class AddressFailure extends AddressState {
  final Failure failure;

  const AddressFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
