import 'package:flutter/material.dart';
import '../../data/user/user_repository.dart';

import '../../data/authentication/authentication.dart';

class Constants {
  static const String loremIpsum =
      '''A random paragraph can also be an excellent way for a writer to tackle writers' block. Writing block can often happen due to being stuck with a current project that the writer is trying to complete. By inserting a completely random paragraph from which to begin, it can take down some of the issues that may have been causing the writers' block in the first place.A random paragraph can also be an excellent way for a writer to tackle writers' block. Writing block can often happen due to being stuck with a current project that the writer is trying to complete. By inserting a completely random paragraph from which to begin, it can take down some of the issues that may have been causing the writers' block in the first place.A random paragraph can also be an excellent way for a writer to tackle writers' block. Writing block can often happen due to being stuck with a current project that the writer is trying to complete. By inserting a completely random paragraph from which to begin, it can take down some of the issues that may have been causing the writers' block in the first place.''';
  static AuthenticationModel? authenticationModel;
  static UserModel? userModel;
  static DateTime? pickedAge;
  // static const String rupee = '₹';
  static const String rupee = '\$';
  static const String host = 'http://blogeetech.com/kynd_store/api/v1/';
  static const double initialLatitude = 28.7041;
  static const double initialLongitude = 77.1025;
  static bool isLoggedIn = false;
  static bool isSkipped = false;
  static bool isIntroSeen = false;
  static int maxPhoneNumberLength = 13;
  static int minPhoneNumberLength = 8;
  // static const int userId = 1;

  static const String geoCodingApiKey =
      'AIzaSyBH-3JNcNnhNmTYMkCg4Y-wIvCstGY0Uh0';
  // static const String token =
  //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjEwMDhlNjk4YTlhYWNkZjc4NDA0ODZhNTBlZjllODA3NDQzZTA3MjA3YWNiNDYyNzhiZWNjYTAzMTM4MWU0MzYwZDAxZTUwMTIwZGIyZjcwIn0.eyJhdWQiOiIxIiwianRpIjoiMTAwOGU2OThhOWFhY2RmNzg0MDQ4NmE1MGVmOWU4MDc0NDNlMDcyMDdhY2I0NjI3OGJlY2NhMDMxMzgxZTQzNjBkMDFlNTAxMjBkYjJmNzAiLCJpYXQiOjE2MzkyMzY3NjMsIm5iZiI6MTYzOTIzNjc2MywiZXhwIjoxNjcwNzcyNzYzLCJzdWIiOiIyNSIsInNjb3BlcyI6W119.ixGS0vppMO1fTMOTrwXTgbKLRpbZPMTZMdzHMzB2MkZPBsYgcriZq1RSGK2F38OnEh6n9sdtTAZMG_-tV-eDeky5l5s4bewxWmRazgDGmXeLKiTY0SWwvISqi_tbZlvnJVYjVk9BhWkva3dBgR1Ry9l1L0Wf5ZBrq6_7NBB0xzQWQ8vn1e9etQnmMpzp5UA1pJfq6o8zBjB50q9LXKkGaSMpQp87NUXIK_9nflNTDZq4Kf4aEjvix2vtKba2bC2CX0qWrlnZUItgCo808pVLlUXIiNvKnJMplVVK0jjTWFC00_eO4WD8b_OteBUl-00vqSSvA57Sesaqjv0N7FWJXsNd_HL63B67tHKhWybNKO7mOkXSNLixZIKbmjfGC6wmglDko152kAFS-9DyHU8ly_mzPTyCqOS48kLjPgTmSXWF9xxLvlMLMsRQymrFseAoI0XfrDESQfBtdtRBaUVs3dHnLEkSs3DOjXcpMP6c2BVY6JQ60nCkuFUitPQjLvkaYtrA-_tieyVBAK7ir74Fe-4V5DqoBWP6USQlP1JCwIj1xyyvhXeztHGnIJ8bz9KxcI3GVmJeX2mjYO1TtnJ2PnRSKmmGdBru1OAGgCuwO4kljAP1bymWZh5Wh3C5H3abDLJ-XK6DPNKlLHSHs9GzzNge8FSD_64DeUVrsQ6-VTk';

  //? Keys
  static const String loginModelKey = 'loginModel';
  static const String loginStatus = 'loginStatus';
  static const String skippedStatus = 'skippedStatus';
  static const String introScreenStatus = 'introScreenStatus';

  // static const Map<String, String>? headers = <String, String>{
  //   'Content-Type': 'application/json',
  //   HttpHeaders.authorizationHeader:
  //       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjRkNDE4N2NjMDJmNWVlZDdmYmE5OTQyMWI2NjM1YmFjNDhiMWZiYTJiNGJjMTdkNjc0ZmJmOTBmZDFmMDFlZmE0NmQyMDg1MjUwMDYxYWFlIn0.eyJhdWQiOiIxIiwianRpIjoiNGQ0MTg3Y2MwMmY1ZWVkN2ZiYTk5NDIxYjY2MzViYWM0OGIxZmJhMmI0YmMxN2Q2NzRmYmY5MGZkMWYwMWVmYTQ2ZDIwODUyNTAwNjFhYWUiLCJpYXQiOjE2MzkyMDIwODMsIm5iZiI6MTYzOTIwMjA4MywiZXhwIjoxNjcwNzM4MDgzLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.OflLLbsdaY47Mfhz5fJzY-5IIWVYWyyS392977YN9QFMv_FPH-hwxLvBZ2AnVf9Y6wLsqmjtxvLgIRJpl4xNMRmYDjhX-6iCXOam2osDAfBhUVr8QlpspfuW3V6rjlhEA68gtU8tjrmvK8JT_knE-MQbV4hOrCe2NZRgoPfcK_U8C4ItrWr8ofRooTxvdiAd1MaYu1Wso6BnP17PhGRiY1WEb7ZxKGscZnK06eL27fAx6EPlJOGBPGiyw8mDIztHvV3oA4wpf92ADsUvBN8VicJSirX9T1WNMtQlGCpiYZ3i8Q7HmsqBtyToAEFKMltEr_XIAlwMzJm3DEy7RRCkItjIY0fcyTAMdQzkZ8wXd2pr7xPbb0ZD-1bR0P13VypSg-xuQ1ZqMg4CWg2EX-lCFVt-kDifHeYPAE5oiYhSgXuBaAB8G8-vzhMoXc6XIxeXQpADg7p-F5B2pqV1ZbRLL3X7LHPvfWjZFMP5V2_ksXbswu8fdL7Xn2EkLb4bg0TO9FLHk35v7f7gvPtWkrh2evzRE3WVkOJK6y4Kj0WVvmJ_elzJKWxrgRIDKf-psZ612IeMywONp64y3wHsSef_IrfL-JzLf4VA1VlkQ4VNZLdGRAHg5YBFivCh8okAUuqrie9WeB6Lx_HJpobiTNPePRLd7LowY_sgf-Ni_Q91EQE'
  // };

  static Map<String, String>? headers =  {
        'Content-type': 'application/json'
      };
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
