part of 'points_earned_data_provider.dart';

class PointsEarnedRepo {
  static Future<PointsEarnedModel> pointsEarned() async {
    final Response _response =
        await PointsEarnedDataProvider._getPointsEarned();
    PointsEarnedModel _bestSellersModel =
        PointsEarnedModel.fromJson(_response.body);
    return _bestSellersModel;
  }
}
