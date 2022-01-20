import 'dart:convert';

import 'package:http/http.dart';
import '../../utils/constants/constants.dart';

class FeedBackDataProvider {
  static Future<bool> sendFeedback({
    required int rating,
    required String feedback,
  }) async {
    dynamic body = jsonEncode(<String, dynamic>{
      'customer_id': Constants.authenticationModel!.success.customerId,
      'rating': rating,
      'feedback': feedback
    });
    final Response response = await post(
      Uri.parse('${Constants.host}add_feedback'),
      body: body,
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw response;
    }
  }
}
