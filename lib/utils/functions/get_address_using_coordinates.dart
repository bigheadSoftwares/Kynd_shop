import 'dart:convert';

import 'package:http/http.dart' as http;
import 'show.dart';

import '../../utils/export_utilities.dart';

Future<String> getAddressFromLatLng(double lat, double lng) async {
  try {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=${Constants.geoCodingApiKey}';
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'][0]['formatted_address']
          as String;
    }
    return '';
  } on Exception catch (e) {
    show('this is the geocode error $e');
    return '';
  }
}
