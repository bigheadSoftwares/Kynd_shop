import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/export_utilities.dart';

part 'user.dart';
part 'user_model.dart';

class UserRepository extends User {
  Future<UserModel> getUserInfo() async {
    http.Response response = await _getUser();
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(
        response,
        serverMessage: jsonDecode(response.body)['message'] as String,
      );
    }

    try {
      return userModelFromJson(response.body);
    } catch (e) {
      throw const Failure(
        message: 'Something went wrong with user model data parsing',
      );
    }
  }

  Future<void> updateUserInfo(UserModel user) async {
    http.Response response = await _updateUser(user: user);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(
        response,
        serverMessage: jsonDecode(response.body)['message'] as String,
      );
    }
  }
}
