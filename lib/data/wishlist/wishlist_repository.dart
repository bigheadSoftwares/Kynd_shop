import 'dart:convert';

import 'package:http/http.dart';
import 'wishlist_data_provider.dart';
import 'wishlist_model/wishlist_model.dart';

class WishlistRepository {
  static Future<WishlistModel> getWishlist() async {
    Response _response = await WishlistDataProvider.getWishlist();
    WishlistModel _wishlistModel = WishlistModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _wishlistModel;
  }
}
