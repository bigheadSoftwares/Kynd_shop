import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    Key? key,
    required this.backgroundImage,
  }) : super(key: key);

  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      backgroundImage,
      height: screenHeight(context),
      width: screenWidth(context),
      fit: BoxFit.fill,
    );
  }
}
