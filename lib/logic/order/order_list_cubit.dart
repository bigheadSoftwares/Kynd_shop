import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../utils/export_utilities.dart';
import '../../data/order/order_repository.dart';
import '../../data/order/order_list_model/order_list_model.dart';

part 'order_list_state.dart';

class OrderListCubit extends Cubit<OrderListState> {
  OrderListCubit() : super(OrderListInitial());
  void getOrderList() {
    emit(OrderListInitial());
    OrderRepository.orderListModel().then(
      (OrderListModel orderListModel) => emit(
        OrderListLoaded(orderListModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          OrderListFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
