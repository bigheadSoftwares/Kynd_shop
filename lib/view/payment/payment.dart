import 'dart:convert';

import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/order/create_order_cubit.dart';
import '../../utils/functions/snackbar.dart';
import '../../logic/address/address_cubit.dart';
import '../../logic/cart/cart_summary_cubit.dart';
import '../../utils/export_utilities.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.offWhite,
      appBar: appBar(context, title: 'Payment'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
        child: BlocBuilder<CartSummaryCubit, CartSummaryState>(
          builder: (BuildContext context, CartSummaryState state) {
            if (state is CartSummaryLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const _PaymentMethod(),
                  sizedBoxHeight(20),
                  _PaymentDetails(
                    state: state,
                  ),
                  _TotalSavings(
                    state: state,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _CheckoutButton(
                      cartSummaryState: state,
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _CheckoutButton extends StatelessWidget {
  const _CheckoutButton({
    Key? key,
    required this.cartSummaryState,
  }) : super(key: key);
  final CartSummaryLoaded cartSummaryState;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (BuildContext context, AddressState state) {
        return BlocListener<CreateOrderCubit, CreateOrderState>(
          listener: (BuildContext context, CreateOrderState state) {
            if (state is CreateOrderLoaded) {
              pushReplacementNamed(context, Routes.paymentSuccessful);
            } else if (state is CreateOrderFailure) {
              showSnackBar(context: context, msg: state.failure.message);
            }
          },
          child: CustomPrimaryButton(
            title: 'PROCEED TO CHECKOUT',
            onTap: () {
              Map<String, dynamic> data = <String, dynamic>{
                'shipping_address': jsonEncode(
                    context.read<AddressCubit>().defaultAddress?[0].toJson()),
                'user_id': Constants.authenticationModel!.success.customerId,
                'payment_type': 'cash_on-delivery',
                'payment_status': 'pending',
                'grand_total': cartSummaryState.cartSummaryModel.grandTotal!
                    .replaceAll('Rs', '')
                    .toDouble(),
                'coupon_discount': cartSummaryState.cartSummaryModel.discount!
                    .replaceAll('Rs', '')
                    .toDouble()
              };
              context.read<CreateOrderCubit>().createOrder(data);
            },
          ),
        );
      },
    );
  }
}

class _TotalSavings extends StatelessWidget {
  const _TotalSavings({
    Key? key,
    required this.state,
  }) : super(key: key);
  final CartSummaryLoaded state;
  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      radius: 0,
      hPadding: 20,
      vPadding: 20,
      color: Colour.greenishBlue.withOpacity(0.15),
      child: CartSummary(
        title: 'Total Savings',
        amount: '${state.cartSummaryModel.discount}',
        size: 14,
        color: Colour.greenishBlue,
      ),
    );
  }
}

class _PaymentDetails extends StatelessWidget {
  const _PaymentDetails({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CartSummaryLoaded state;

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
          CartSummary(
            title: 'Subtotal',
            amount: '${state.cartSummaryModel.subTotal}',
          ),
          CartSummary(
            title: 'Coupon Discount',
            amount: '${state.cartSummaryModel.discount}',
          ),
          const CartSummary(
            title: 'Charity Donation',
            amount: '0',
          ),
          // CartSummary(
          //   title: 'Tax Rates',
          //   amount: '${state.cartSummaryModel.tax}',
          // ),
          CartSummary(
            title: 'Delivery fee',
            amount: '${state.cartSummaryModel.shippingCost}',
          ),
          CartSummary(
            title: 'Total Amount',
            amount: '${state.cartSummaryModel.grandTotal}',
            isBold: true,
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
              'Cash on Delivery',
              fontWeight: FontWeight.bold,
            ),
            trailing: InkWell(
              child: CustomImageWidget(
                image: Assets.radio,
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
          // const ListTile(
          //   title: SubHeading2(
          //     'Credit Card',
          //     fontWeight: FontWeight.bold,
          //   ),
          //   trailing: InkWell(
          //     child: CustomImageWidget(
          //       image: Assets.radio,
          //       scale: 2,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
