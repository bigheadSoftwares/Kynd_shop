import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.image,
    this.height,
    this.width,
    this.scale,
    this.fit,
    this.color
  }) : super(key: key);

  final String image;
  final double? height;
  final double? width;
  final double? scale;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      color: color,
      fit: fit ?? BoxFit.fill,
      scale: scale,
    );
  }
}
