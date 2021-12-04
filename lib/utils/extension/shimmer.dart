import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension MyShimmer on Widget {
  Widget shimmer({
    Color? baseColor,
    Color? highLightColor,
    ShimmerDirection? direction,
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highLightColor ?? Colors.grey.shade100,
      direction: direction ?? ShimmerDirection.ltr,
      child: this,
    );
  }
}
