import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.offWhite,
      appBar: appBar(context, title: 'Payment'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomPrimaryButton(
              title: 'PROCEED TO CHECKOUT',
              onTap: () {
                pushNamed(context, Routes.paymentSuccessful);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const _PaymentMethod(),
            sizedBoxHeight(20),
            const _PaymentDetails(),
            const _TotalSavings()
          ],
        ),
      ),
    );
  }
}

class _TotalSavings extends StatelessWidget {
  const _TotalSavings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      radius: 0,
      hPadding: 20,
      vPadding: 20,
      color: Colour.greenishBlue.withOpacity(0.15),
      child: const CartSummary(
        title: 'Total Savings',
        amount: 432.45,
        size: 14,
        color: Colour.greenishBlue,
      ),
    );
  }
}

class _PaymentDetails extends StatelessWidget {
  const _PaymentDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      borderColor: Colour.lightGrey,
      borderWidth: 0.1,
      hPadding: 20,
      vPadding: 20,
      radius: 0,
      color: Colour.white,
      width: screenWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SubHeading2(
            'PAYMENT DETAILS',
            color: Colour.lightGrey,
            size: 12,
            fontWeight: FontWeight.bold,
          ),
          sizedBoxHeight(20),
          const CartSummary(
            title: 'Subtotal',
            size: 14,
            amount: 7774,
          ),
          const CartSummary(
            title: 'Coupon Discount',
            amount: -24,
            size: 14,
          ),
          const CartSummary(
            title: 'Charity Donation',
            amount: 87,
            size: 14,
          ),
          const CartSummary(
            title: 'Tax Rates',
            amount: 34,
            size: 14,
          ),
          const CartSummary(
            title: 'Delivery fee',
            amount: 54,
            size: 14,
          ),
          const CartSummary(
            title: 'Total Amount',
            amount: 8234,
            isBold: true,
            size: 14,
          ),
        ],
      ),
    );
  }
}

class _PaymentMethod extends StatelessWidget {
  const _PaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      borderColor: Colour.lightGrey,
      borderWidth: 0.1,
      hPadding: 0,
      vPadding: 0,
      radius: 0,
      color: Colour.white,
      child: Column(
        children: <Widget>[
          const ListTile(
            title: SubHeading2(
              'Debit Card',
              fontWeight: FontWeight.bold,
            ),
            trailing: InkWell(
              child: CustomImageWidget(
                image: Assets.unradio,
                scale: 2,
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 0.5,
            indent: 15,
            endIndent: 15,
            color: Colour.lightGrey.withOpacity(0.6),
          ),
          const ListTile(
            title: SubHeading2(
              'Credit Card',
              fontWeight: FontWeight.bold,
            ),
            trailing: InkWell(
              child: CustomImageWidget(
                image: Assets.radio,
                scale: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
