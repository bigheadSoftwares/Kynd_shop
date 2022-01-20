import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'export_utilities.dart';

Failure handleError(dynamic response, {String? serverMessage}) {
  Failure? _failure;
  if (response.runtimeType == Response) {
    final int statusCode = response.statusCode as int;
    if (statusCode == 401) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Not authorized to perform action',
        type: errorType.unAuthorized,
      );
      showToast('Please login to continue');
      Constants.navigatorKey.currentState!.pushNamedAndRemoveUntil(
        Routes.loginScreen,
        (dynamic route) => false,
      );
    } else if (statusCode == 400) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Oh! Bad request',
        type: errorType.notFound,
      );
    } else if (statusCode == 402) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Payment required',
        type: errorType.others,
      );
    } else if (statusCode == 403) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Access forbidden',
        type: errorType.others,
      );
    } else if (statusCode == 404) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Not found!',
        type: errorType.notFound,
      );
    } else if (statusCode == 405) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Method not allowed',
        type: errorType.others,
      );
    } else if (statusCode == 406) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Incorrect parameter!',
        type: errorType.others,
      );
    } else if (statusCode == 409) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Conflict! can not connect to the server',
        type: errorType.others,
      );
    } else if (statusCode == 410) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: "Data doesn't exist anymore",
        type: errorType.others,
      );
    } else if (statusCode == 415) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Unsupported media type',
        type: errorType.others,
      );
    } else if (statusCode == 426) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Upgrade required',
        type: errorType.others,
      );
    } else if (statusCode == 500) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Oops! server got an issue',
        type: errorType.serverError,
      );
    } else if (statusCode == 501) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Oops! Error 501 not implemented',
        type: errorType.serverError,
      );
    } else if (statusCode == 502) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Oops! Bad Gateway',
        type: errorType.serverError,
      );
    } else if (statusCode == 503) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Oops! server is unavailable',
        type: errorType.serverError,
      );
    } else if (statusCode == 521) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Server is currently down',
        type: errorType.serverError,
      );
    } else if (statusCode == 525) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'SSL handshake failed',
        type: errorType.serverError,
      );
    } else {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Something went wrong...',
        type: errorType.others,
      );
    }
  } else {
    final Type type = response.runtimeType;
    if (type == Failure) {
      _failure = response as Failure;
    } else if (type == SocketException || type == ClientException) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Check your internet connection',
        type: errorType.internet,
      );
    } else if (type == FormatException) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Unable to process data',
        type: errorType.format,
      );
    } else if (type == HttpException) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Got http error',
        type: errorType.http,
      );
    } else if (type == TimeoutException) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Request time out',
        type: errorType.timeout,
      );
    } else if (type == Exception) {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Wrong Very wrong',
        type: errorType.timeout,
      );
    } else {
      _failure = Failure(
        serverMessage: serverMessage ?? '',
        message: 'Something went wrong',
        type: errorType.others,
      );
    }
  }
  return _failure;
}

enum errorType {
  internet,
  http,
  format,
  unAuthorized,
  notFound,
  serverError,
  timeout,
  others
}

class Failure with Exception {
  const Failure({
    required this.message,
    this.type,
    this.serverMessage,
  });

  final String message;
  final String? serverMessage;
  final errorType? type;
}
