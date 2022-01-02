import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/address/address_data_provider.dart';

part 'make_default_state.dart';

class MakeDefaultCubit extends Cubit<MakeDefaultState> {
  MakeDefaultCubit() : super(MakeDefaultInitial());

  void makeDefault(int addressId) {
    emit(MakeDefaultLoading());
    AddressDataProvider.makeDefault(addressId).then(
      (bool value) {
        if (value) {
          emit(MakeDefaultLoaded());
        } else {
          emit(const MakeDefaultFailure(
              Failure(message: 'Something went wrong')));
        }
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          MakeDefaultFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
