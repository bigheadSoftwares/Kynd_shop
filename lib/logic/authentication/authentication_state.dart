part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => <Object>[];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccessful extends AuthenticationState {}

class RegistrationSuccessful extends AuthenticationState {}

class RegistrationError extends AuthenticationState {
  const RegistrationError(this.error);
  final Failure error;

  @override
  List<Failure> get props => <Failure>[error];
}

class AuthenticationOtpSent extends AuthenticationState {
  const AuthenticationOtpSent(this.phoneNo);
  final String phoneNo;

  @override
  List<String> get props => <String>[phoneNo];
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.error);
  final Failure error;

  @override
  List<Failure> get props => <Failure>[error];
}
