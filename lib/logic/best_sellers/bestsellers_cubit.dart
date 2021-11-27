import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/bestsellers/best_sellers_repository.dart';
import '../../data/bestsellers/best_sellers_model.dart';

part 'bestsellers_state.dart';

class BestsellersCubit extends Cubit<BestsellersState> {
  BestsellersCubit() : super(BestsellersInitial());
  void getBestSellers() {
    BestSellersRepository.newProducts().then(
      (BestSellersModel bestSellersModel) => emit(
        BestsellersLoaded(bestSellersModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          BestsellersFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
