import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/combos/combos_model.dart';
import '../../data/combos/combos_repository.dart';

part 'combos_state.dart';

class CombosCubit extends Cubit<CombosState> {
  CombosCubit() : super(CombosInitial());

   void getCombos() {
    CombosRepository.getCombos().then(
      (CombosModel combosModel) => emit(
        CombosLoaded(combosModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          CombosFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
