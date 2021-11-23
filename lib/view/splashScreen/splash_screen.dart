import 'dart:async';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
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
    Timer(
      const Duration(seconds: 3),
      () {
        // pushNamed(context, '/category');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
      ),
    );
  }
}
