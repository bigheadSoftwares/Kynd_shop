import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';
import '../extension/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    Key? key,
    this.height,
    this.width,
    this.itemCount,
  }) : super(key: key);
  final double? height;
  final double? width;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 100,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 12, right: 12),
        itemCount: itemCount ?? 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: RoundContainer(
              width: width ?? 70,
              color: Colour.lightGrey.withOpacity(0.3),
              child: const SizedBox(),
            ).shimmer(),
          );
        },
      ),
    );
  }
}
