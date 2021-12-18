import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:easy_coding/handle_error.dart';
import 'package:http/http.dart' as http;
import '../../utils/export_utilities.dart';

part 'blog.dart';
part 'blog_model.dart';

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
    } catch (_) {
      throw const Failure(
        message: 'Something went wrong with blog data parsing',
      );
    }
  }
}
