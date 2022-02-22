import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart' as bighead;
import 'package:equatable/equatable.dart';
import '../../data/authentication/authentication.dart';
import '../../data/user_status_data/user_status_data.dart';

part 'user_status_state.dart';

class UserStatusCubit extends Cubit<UserStatusState> {
  UserStatusCubit() : super(UserStatusInitial());

  final AuthenticationRepository _repo = AuthenticationRepository();
  late UserStatusData data;
  Future<void> userStatus() async {
    _repo.userStatus().then(
      (UserStatusData value) {
        data = value;
        emit(UserStatusLoaded(value));
      },
      onError: (dynamic error, StackTrace stackTrace) {
        emit(UserStatusFailure(bighead.handleError(error)));
      },
    );
  }
}
