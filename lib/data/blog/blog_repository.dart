import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/export_utilities.dart';

part 'blog.dart';
part 'blog_model.dart';
part 'blog_comments_model.dart';

class BlogRepository extends Blog {
  Future<BlogModel> getBlogs() async {
    final http.Response response = await _getBlogs();

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(
        response,
        serverMessage: jsonDecode(response.body)['message'] as String,
      );
    }

    try {
      return blogModelFromJson(response.body);
    } catch (e) {
      throw const Failure(
        message: 'Something went wrong with blog data parsing',
      );
    }
  }

  Future<void> addBlog({
    required String title,
    required String description,
    required String image,
    required int category,
  }) async {
    final http.StreamedResponse response = await _addBlog(
      title: title,
      description: description,
      image: image,
      category: category,
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(response);
    }
  }

  Future<BlogCommentsModel> getComments(int blogId) async {
    final http.Response response = await _getComments(blogId);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(
        response,
        serverMessage: jsonDecode(response.body)['message'] as String,
      );
    }

    return blogCommentsModelFromJson(response.body);
  }

  Future<void> addComment({
    required int blogId,
    required String comment,
  }) async {
    final http.Response response = await _addComment(
      blogId: blogId,
      comment: comment,
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(response);
    }
  }

  Future<void> like(int blogId) async {
    final http.Response response = await _like(blogId);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(response);
    }
  }
}
