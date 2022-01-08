part of 'authentication.dart';

class AuthenticationRepository extends Authentication {
  Future<LoginDataModel> loginData({
    required String phoneNo,
  }) async {
    LoginDataModel _model;
    final http.Response response = await _login(phoneNo);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      if (response.statusCode == 401) {
        throw const Failure(message: 'User Not Found');
      }
      throw handleError(response);
    }
    try {
      _model = loginDataModelFromJson(response.body);
    } catch (e) {
      throw const Failure(message: 'Login Data parsing gone wrong');
    }
    return _model;
  }

  Future<UserStatusData> userStatus() async {
    UserStatusData _data;
    final http.Response response = await _getUserStatus();
    if (response.statusCode < 200 || response.statusCode >= 300) {
      if (response.statusCode == 401) {
        throw const Failure(message: 'User Not Found');
      }
      throw handleError(response);
    }
    try {
      _data = UserStatusData.fromJson(response.body);
    } catch (e) {
      throw const Failure(message: 'Login Data parsing gone wrong');
    }
    return _data;
  }

  Future<AuthenticationModel> confirmCode({
    required int userId,
    required int verificationCode,
  }) async {
    AuthenticationModel _model;
    final http.Response response = await _confirmCode(
      userId,
      verificationCode,
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      if (response.statusCode == 401) {
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

  Future<void> register({
    required String phoneNo,
    required String name,
    required DateTime dob,
    String? referral,
  }) async {
    final http.Response response = await _register(
      phoneNo: phoneNo,
      name: name,
      dob: dob,
      referral: referral,
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(
        response,
        serverMessage: jsonDecode(response.body)['message'] as String,
      );
    }
  }
}
