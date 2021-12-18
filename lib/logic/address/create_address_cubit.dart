import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/add_address_model.dart';
import '../../data/address/address_data_provider.dart';

part 'create_address_state.dart';

class CreateAddressCubit extends Cubit<CreateAddressState> {
  CreateAddressCubit() : super(CreateAddressInitial());
  void createAddress(AddAddressModel data) {
    emit(CreateAddressInitial());
    AddressDataProvider.createAddress(data).then(
      (bool value) {
        if (value) {
          emit(CreateAddressLoaded());
        } else {
          emit(const CreateAddressFailure(
              Failure(message: 'Something went wrong')));
        }
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          CreateAddressFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
