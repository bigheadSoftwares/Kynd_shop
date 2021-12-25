part of 'blog_repository.dart';

class Blog {
  Future<http.Response> _getBlogs() async {
    final Uri _url = Uri.parse('${Constants.host}bloglist');

    final http.Response _response =
        await http.post(_url, headers: <String, String>{
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer ${Constants.authenticationModel!.success.token}',
    });

    return _response;
  }

  Future<http.StreamedResponse> _addBlog({
    required String title,
    required String description,
    required String image,
    required int category,
  }) async {
    final Uri _url = Uri.parse('${Constants.host}add_blog');

    final http.MultipartRequest request = http.MultipartRequest('POST', _url);

    request.headers.addAll(<String, String>{
      'Content-Type': 'multipart/form-data',
      HttpHeaders.authorizationHeader:
          'Bearer ${Constants.authenticationModel!.success.token}',
    });

    request.fields['title'] = title;
    request.fields['slug'] = title;
    request.fields['description'] = description;
    request.fields['image'] = image;
    request.fields['category_id'] = category.toString();
    request.fields['user_id'] =
        Constants.authenticationModel!.success.customerId.toString();

    request.files.add(await http.MultipartFile.fromPath('banner', image));

    final http.StreamedResponse _response = await request.send();

    return _response;
  }
}
