import 'package:flutter/material.dart';

import '../export_utilities.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.height,
    this.color,
  }) : super(key: key);
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: color ?? Colour.greenishBlue,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
