import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/user/user_repository.dart';
import '../../utils/export_utilities.dart';

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

  void updateUserImage({
    required XFile file,
    required UserModel user,
  }) {
    _repo.updateUserImage(file: file, user: user);
  }

  void reset() => emit(UserInitial());
}
