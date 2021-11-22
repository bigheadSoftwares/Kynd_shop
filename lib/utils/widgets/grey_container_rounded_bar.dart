import 'package:flutter/material.dart';
import '../export_utilities.dart';

class GreyContainerRoundedBar extends StatelessWidget {
  const GreyContainerRoundedBar({
    Key? key,
    this.barWidth,
    this.borderWidth,
    this.colorOpacity,
    this.hPadding,
    this.vPadding,
  }) : super(key: key);

  final double? hPadding;
  final double? vPadding;
  final double? barWidth;
  final double? borderWidth;
  final double? colorOpacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: hPadding ?? 12.0, vertical: vPadding ?? 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: barWidth ?? 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colour.lightGrey.withOpacity(colorOpacity ?? 0.3),
                  width: borderWidth ?? 3,
                )),
          ),
        ],
      ),
    );
  }
}
