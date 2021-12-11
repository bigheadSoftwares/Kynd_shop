import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    Key? key,
    required this.onAddToCart,
  }) : super(key: key);

  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        onTap: onAddToCart ?? () {},
        hPadding: 5,
        borderWidth: 1,
        borderColor: Colour.greenishBlue,
        radius: 4,
        child: Row(
          children: const <Widget>[
            SubHeading2(
              'Add',
              color: Colour.greenishBlue,
              size: 13,
            ),
            Icon(
              Icons.add,
              color: Colour.greenishBlue,
              size: 13,
            )
          ],
        ),
      );
  }
}