import 'dart:async';
import 'dart:convert';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../data/authentication/authentication.dart';
import '../../utils/widgets/logo.dart';
import '../../utils/export_utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getPreferencesAndNavigateAccordingly();
    super.initState();
  }

  void getPreferencesAndNavigateAccordingly() async {
    Constants.isIntroSeen = await readBool(Constants.introScreenStatus);
    Constants.isLoggedIn = await readBool(Constants.loginStatus);
    Constants.isSkipped = await readBool(Constants.skippedStatus);
    if (Constants.isLoggedIn) {
      Constants.authenticationModel = authenticationModelFromJson(
        await readData(Constants.loginModelKey),
      );
    }
    Timer(
      const Duration(seconds: 3),
      () {
        if (Constants.isLoggedIn) {
          pushNamedAndRemoveUntil(context, Routes.home);
        } else {
          pushNamedAndRemoveUntil(context, Routes.ageConfirmationScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const BackgroundImageWidget(
            backgroundImage: Assets.backGroundImage,
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight(context) * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Logo(
                  height: screenHeight(context) * 0.3,
                  width: screenWidth(context) * 0.65,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
