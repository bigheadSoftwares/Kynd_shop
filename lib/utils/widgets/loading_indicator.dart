import 'package:flutter/material.dart';

import '../export_utilities.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.height,
  }) : super(key: key);
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colour.green,
        ),
      ),
    );
  }
}
