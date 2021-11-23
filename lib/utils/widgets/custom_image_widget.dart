import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.image,
    this.height,
    this.width,
    this.scale,
    this.fit,
  }) : super(key: key);

  final String image;
  final double? height;
  final double? width;
  final double? scale;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: fit ?? BoxFit.fill,
      scale: scale,
    );
  }
}
