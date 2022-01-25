import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kynd_shop/utils/export_utilities.dart';
import '../../data/order/order_repository.dart';
import '../../data/order/order_detail_model/order_detail_model.dart';

part 'order_detail_state.dart';

class OrderDetailCubit extends Cubit<OrderDetailState> {
  OrderDetailCubit() : super(OrderDetailInitial());
  void getOrderDetail(int orderId) {
    emit(OrderDetailInitial());
    OrderRepository.orderDetailModel(orderId).then(
      (OrderDetailModel orderDetailModel) => emit(
        OrderDetailLoaded(orderDetailModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          OrderDetailFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
