part of 'authentication.dart';

class AuthenticationRepository extends Authentication {
  Future<AuthenticationModel> loginData({
    required String phoneNo,
  }) async {
    AuthenticationModel _model;
    final http.Response response = await _login(phoneNo);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      if(response.statusCode == 401){
        throw const Failure(message: 'User Not Found');
      }
     
      throw handleError(response);
    }
    try {
      _model = authenticationModelFromJson(response.body);
    } catch (e) {
      throw const Failure(message: 'Login Data parsing gone wrong');
    }
    return _model;
  }

  Future<void> sendOtp({required String phoneNo, required String otp}) async {
    final http.Response response = await _generateAndSendOtp(
      phoneNo: phoneNo,
      otp: otp,
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(response);
    }
  }
}
