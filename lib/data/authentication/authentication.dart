import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kynd_shop/utils/functions/show.dart';
import '../user_status_data/user_status_data.dart';
import 'login_data_model.dart';
import '../../utils/export_utilities.dart';

part 'authentication_repository.dart';
part 'authentication_model.dart';

// All the api calls related to [Authentication] will be found here
class Authentication {
  Future<http.Response> _login(
    String phoneNo,
  ) async {
    final String body = jsonEncode(<String, String>{
      'phone': phoneNo,
    });

    final Uri url = Uri.parse('${Constants.host}auth/login');
    final http.Response response = await http.post(
      url,
      body: body,
      headers: Constants.headers,
    );
    show('login response ${response.body}');
    return response;
  }

  Future<http.Response> _confirmCode(
    int userId,
    int verificationCode,
  ) async {
    final String body = jsonEncode(<String, dynamic>{
      'user_id': userId,
      'verification_code': verificationCode
    });

    final Uri url = Uri.parse('${Constants.host}auth/confirm_code');
    final http.Response response = await http.post(
      url,
      body: body,
      headers: Constants.headers,
    );
    show(response.body);
    return response;
  }

  Future<http.Response> _getUserStatus() async {
    final String body = jsonEncode(<String, dynamic>{
      'id': Constants.authenticationModel?.success.customerId ?? 0,
    });
    final http.Response response = await http.post(
      Uri.parse('${Constants.host}user_status'),
      body: body,
      headers: Constants.headers,
    );
    return response;
  }

  Future<http.Response> _register({
    required String phoneNo,
    required String name,
    required DateTime dob,
    String? referral,
  }) async {
    final String body = jsonEncode(<String, String>{
      'phone': phoneNo,
      'name': name,
      'dob': DateFormat('dd-mm-yyyy').format(dob),
      'referral_code': referral ?? '',
    });

    final Uri url = Uri.parse('${Constants.host}auth/signup');
    final http.Response response = await http.post(
      url,
      body: body,
      headers: Constants.headers,
    );
    return response;
  }
}
