import 'package:dotted_border/dotted_border.dart';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../../utils/export_utilities.dart';
part 'cart_item_tile.dart';
part 'cart_bottom_section.dart';
part 'promo.dart';
part 'cart_summary.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'Cart'),
      bottomNavigationBar: const _CartBottomSection(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const _CartItemTile(),
            sizedBoxHeight(20),
            const SubHeading2(
              'Have a Promo code?',
              size: 12,
              fontWeight: FontWeight.bold,
            ),
            const _PromoContainer(),
            sizedBoxHeight(20),
            const CartSummary(
              title: 'Subtotal',
              amount: 7774,
            ),
            const CartSummary(
              title: 'Coupon Discount',
              amount: -24,
            ),
            const CartSummary(
              title: 'Charity Donation',
              amount: 87,
            ),
            const CartSummary(
              title: 'Tax Rates',
              amount: 34,
            ),
            const CartSummary(
              title: 'Delivery fee',
              amount: 54,
            ),
            const CartSummary(
              title: 'Total Amount',
              amount: 8234,
              isBold: true,
            ),
          ],
        ),
      ),
    );
  }
}
