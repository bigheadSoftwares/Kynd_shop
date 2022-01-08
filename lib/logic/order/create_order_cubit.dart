import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/order/order_data_provider.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit() : super(CreateOrderInitial());
  void createOrder(Map<String, dynamic> data) {
    emit(CreateOrderLoading());
    OrderDataProvider.createOrder(data).then(
      (bool value) {
        if (value) {
          emit(CreateOrderLoaded());
        } else {
          emit(const CreateOrderFailure(
              Failure(message: 'Something went wrong')));
        }
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          CreateOrderFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
