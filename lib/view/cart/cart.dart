import 'package:dotted_border/dotted_border.dart';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cart/cart_summary_cubit.dart';
import '../../data/cart/cart_detaiils_model/datum.dart';
import '../../logic/cart/cart_details_cubit.dart';
import '../../utils/functions/snackbar.dart';
import '../../utils/export_utilities.dart';
part 'cart_item_tile.dart';
part 'cart_bottom_section.dart';
part 'promo.dart';

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
            BlocConsumer<CartDetailsCubit, CartDetailsState>(
              bloc: context.read<CartDetailsCubit>()..getCartDetails(),
              listener: (BuildContext context, CartDetailsState state) {
                if (state is CartDetailsFailure) {
                  showSnackBar(context: context, msg: state.failure.message);
                }
              },
              builder: (BuildContext context, CartDetailsState state) {
                if (state is CartDetailsLoaded) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.cartDetaiilsModel.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Datum item = state.cartDetaiilsModel.data![index];
                      return _CartItemTile(
                        item: item,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return sizedBoxHeight(15);
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
            sizedBoxHeight(20),
            const SubHeading2(
              'Have a Promo code?',
              size: 12,
              fontWeight: FontWeight.bold,
            ),
            const _PromoContainer(),
            sizedBoxHeight(20),
            BlocConsumer<CartSummaryCubit, CartSummaryState>(
              bloc: context.read<CartSummaryCubit>()..getCartSummary(),
              listener: (BuildContext context, CartSummaryState state) {
                if (state is CartSummaryFailure) {
                  showSnackBar(context: context, msg: state.failure.message);
                }
              },
              builder: (BuildContext context, CartSummaryState state) {
                if (state is CartSummaryLoaded) {
                  return Column(
                    children: <Widget>[
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
                      CartSummary(
                        title: 'Tax Rates',
                        amount: '${state.cartSummaryModel.tax}',
                      ),
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
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
