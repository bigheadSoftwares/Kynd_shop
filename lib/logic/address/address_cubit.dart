import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart' as bighead;
import 'package:equatable/equatable.dart';
import '../../utils/export_utilities.dart';
import '../../utils/functions/show.dart';
import '../../data/address/my_addresses_model/datum.dart';
import '../../data/address/address_repository.dart';
import '../../data/address/my_addresses_model/my_addresses_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  late List<AddressDatum> defaultAddress;

  void getMyAddresses() {
    emit(AddressLoading());
    AddressRepository.getAddresses().then(
      (MyAddressesModel myAddressesModel) {
        defaultAddress = myAddressesModel.data!
            .where((AddressDatum element) => element.setDefault == 1)
            .toList();

        show(defaultAddress);
        if (defaultAddress.isEmpty) {
          defaultAddress.add(myAddressesModel.data![0]);
        }
        emit(
          AddressLoaded(myAddressesModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          AddressFailure(
            bighead.handleError(error),
          ),
        );
      },
    );
  }
}
