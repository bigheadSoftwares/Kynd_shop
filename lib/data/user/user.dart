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
    Map<String, dynamic> body = userModelToJson(user);
    body.addAll(<String, dynamic>{'image': ''});
    final http.Response _response = await http.post(
      _url,
      body: jsonEncode(body),
      headers: Constants.headers,
    );
    return _response;
  }

  Future<http.Response> _updateUserImage(
      {required UserModel user, required XFile image}) async {
    final Uri _url = Uri.parse('${Constants.host}user/info/update');

    final http.MultipartRequest request = http.MultipartRequest('POST', _url);

    request.headers.addAll(
      Constants.headers!,
    );
    request.fields['email'] = user.email ?? '';
    request.fields['name'] = user.name;
    request.fields['dob'] = user.dob.toString();
    request.fields['user_id'] =
        Constants.authenticationModel?.success.customerId.toString() ?? '0';

    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    final http.StreamedResponse _response = await request.send();
    return await http.Response.fromStream(_response);
  }
}
