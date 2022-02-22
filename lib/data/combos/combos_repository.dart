import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/constants/constants.dart';
import 'combos_model.dart';

part 'combos_data_provider.dart';

class CombosRepository {
  static Future<CombosModel> getCombos() async {
    final Response _response = await CombosDataProvider._getCombos();
    CombosModel _bestSellersModel = CombosModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _bestSellersModel;
  }
}
