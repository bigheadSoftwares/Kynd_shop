import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/address/address_repository.dart';
import '../../data/address/my_addresses_model/my_addresses_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  void getMyAddresses() {
    emit(AddressInitial());
    AddressRepository.getAddresses().then(
      (MyAddressesModel myAddressesModel) => emit(
        AddressLoaded(myAddressesModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          AddressFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
