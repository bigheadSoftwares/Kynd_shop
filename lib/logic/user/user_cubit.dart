import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/user/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final UserRepository _repo = UserRepository();

  Future<void> getUser() async {
    emit(UserLoading());
    _repo.getUserInfo().then(
      (UserModel user) => emit(UserSuccess(user: user)),
      onError: (dynamic error, StackTrace trace) {
        emit(UserFailure(handleError(error)));
      },
    );
  }

  Future<void> updateUser(UserModel user) async {
    _repo.updateUserInfo(user).then((_) => emit(UserUpdatedSuccessfully()),
        onError: (dynamic error, StackTrace trace) {
      emit(UserFailure(handleError(error)));
    });
  }

  void reset() => emit(UserInitial());
}
