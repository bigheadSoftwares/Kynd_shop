import 'dart:convert';

import 'package:http/http.dart';
import 'points_earned_model/points_earned_model.dart';
import '../../utils/export_utilities.dart';

part 'points_earned_repo.dart';

class PointsEarnedDataProvider {
  static Future<Response> _getPointsEarned() async {
    dynamic body = jsonEncode(<String, dynamic>{
      'user_id': Constants.authenticationModel!.success.customerId,
    });
    final Response response = await post(
      Uri.parse('${Constants.host}points_earned'),
      body: body,
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }
}
