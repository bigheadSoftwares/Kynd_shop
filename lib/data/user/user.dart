part of 'user_repository.dart';

class User {
  Future<http.Response> _getUser() async {
    final Uri _url = Uri.parse('${Constants.host}auth/user');
    final http.Response _response = await http.get(
      _url,
      headers: Constants.headers,
    );
    return _response;
  }

  Future<http.Response> _updateUser({required UserModel user}) async {
    final Uri _url = Uri.parse('${Constants.host}user/info/update');
    final http.Response _response = await http.post(
      _url,
      body: userModelToJson(user),
      headers: Constants.headers,
    );
    return _response;
  }
}
