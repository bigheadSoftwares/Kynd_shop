import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
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
    required String otp,
  }) async {
    // if (otp.length < 4 || otp != this.otp) {
    if (2 == 3) {
      emit(const AuthenticationError(Failure(message: 'Invalid OTP')));
    } else {
      emit(AuthenticationLoading());
      _repo.loginData(phoneNo: phoneNo).then(
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

  Future<void> sendOtp(String phoneNo) async {
    otp = (Random().nextInt(9000) + 1000).toString();

    _repo.sendOtp(phoneNo: phoneNo, otp: otp!).then(
      (_) {
        emit(AuthenticationOtpSent(phoneNo));
      },
      onError: (dynamic error, StackTrace stackTrance) {
        emit(AuthenticationError(handleError(error)));
      },
    );
  }

  void reset() => emit(AuthenticationInitial());
}
