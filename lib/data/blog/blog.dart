part of 'blog_repository.dart';

class Blog {
  Future<http.Response> _getBlogs() async {
    final Uri _url = Uri.parse('${Constants.host}bloglist');

    final http.Response _response = await http.get(_url, headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer ${Constants.authenticationModel!.success.token}',
    });
    return _response;
  }
}
