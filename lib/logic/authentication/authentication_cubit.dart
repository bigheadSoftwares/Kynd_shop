import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/authentication/login_data_model.dart';
import '../../utils/export_utilities.dart';

import '../../data/authentication/authentication.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  final AuthenticationRepository _repo = AuthenticationRepository();
  String? otp;
  AuthenticationModel? _authenticationModel;

  Future<void> validateAndLogin({
    required String phoneNo,
  }) async {
    // if (otp.length < 4 || otp != this.otp) {
    emit(AuthenticationLoading());
    _repo.loginData(phoneNo: phoneNo).then(
      (LoginDataModel value) {
        emit(LoginSuccessful(value));
      },
      onError: (dynamic error, StackTrace stackTrace) {
        emit(LoginError(handleError(error)));
      },
    );
  }

  Future<void> confirmCode({
    required int userId,
    required int confirmCode,
  }) async {
    // if (otp.length < 4 || otp != this.otp) {
    if (2 == 3) {
      emit(const AuthenticationError(Failure(message: 'Invalid OTP')));
    } else {
      emit(AuthenticationLoading());
      _repo
          .confirmCode(
        userId: userId,
        verificationCode: confirmCode,
      )
          .then(
        (AuthenticationModel value) {
          _authenticationModel = value;
          Constants.authenticationModel = value;
          saveData(
            key: Constants.loginModelKey,
            data: authenticationModelToJson(_authenticationModel!),
          ).then(
            (_) {
              saveBool(key: Constants.loginStatus, value: true);
              emit(AuthenticationSuccessful());
            },
            onError: (dynamic error, StackTrace stackTrance) {
              emit(
                const AuthenticationError(
                  Failure(message: 'Could not save login data to preferences'),
                ),
              );
            },
          );
        },
        onError: (dynamic error, StackTrace stackTrace) {
          emit(AuthenticationError(handleError(error)));
        },
      );
    }
  }

  Future<void> register({
    required String phoneNo,
    required String name,
    required DateTime dob,
    String? referral,
  }) async {
    _repo
        .register(
      phoneNo: phoneNo,
      name: name,
      dob: dob,
      referral: referral,
    )
        .then((_) {
      emit(RegistrationSuccessful());
    }, onError: (dynamic error, StackTrace stackTrace) {
      emit(RegistrationError(handleError(error)));
    });
  }

  void reset() => emit(AuthenticationInitial());
}
