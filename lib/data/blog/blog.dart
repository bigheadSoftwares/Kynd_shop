part of 'blog_repository.dart';

class Blog {
  Future<http.Response> _getBlogs() async {
    final Uri _url = Uri.parse('${Constants.host}bloglist');

    final http.Response _response = await http.post(
      _url,
      body: jsonEncode(
        <String, dynamic>{
          'user_id': Constants.authenticationModel?.success.customerId,
        },
      ),
      headers: Constants.headers,
    );
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

    request.headers.addAll(
      Constants.headers,
    );

    request.fields['title'] = title;
    request.fields['slug'] = title;
    request.fields['description'] = description;
    request.fields['image'] = image;
    request.fields['category_id'] = category.toString();
    request.fields['user_id'] =
        Constants.authenticationModel?.success.customerId.toString() ?? '0';

    request.files.add(await http.MultipartFile.fromPath('banner', image));

    final http.StreamedResponse _response = await request.send();

    return _response;
  }

  Future<http.Response> _getComments(int blogId) async {
    final Uri _url = Uri.parse('${Constants.host}getCommet');

    final http.Response _response = await http.post(
      _url,
      body: jsonEncode(
        <String, dynamic>{
          'blog_id': blogId,
        },
      ),
      headers: Constants.headers,
    );

    return _response;
  }

  Future<http.Response> _addComment({
    required int blogId,
    required String comment,
  }) async {
    final Uri _url = Uri.parse('${Constants.host}blog_comment');
    return await http.post(
      _url,
      body: jsonEncode(<String, dynamic>{
        'blog_id': blogId,
        'comment': comment,
        'user_id': Constants.authenticationModel?.success.customerId,
      }),
      headers: Constants.headers,
    );
  }

  Future<http.Response> _like(int blogId) async {
    final Uri _url = Uri.parse('${Constants.host}likeBlog');
    return await http.post(
      _url,
      body: jsonEncode(
        <String, dynamic>{
          'blog_id': blogId,
          'user_id': Constants.authenticationModel?.success.customerId,
        },
      ),
      headers: Constants.headers,
    );
  }
}
