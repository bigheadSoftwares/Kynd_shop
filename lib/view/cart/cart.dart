import 'package:dotted_border/dotted_border.dart';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kynd_shop/data/models/add_address_model.dart';
import 'package:kynd_shop/utils/functions/show.dart';
import '../../data/address/my_addresses_model/datum.dart';
import '../../logic/address/address_cubit.dart';
import '../../logic/coupon/coupon_cubit.dart';
import '../../logic/coupon/coupon_remove_cubit.dart';
import 'coupon_list.dart';
import '../../logic/cart/cart_summary_cubit.dart';
import '../../data/cart/cart_detaiils_model/datum.dart';
import '../../logic/cart/cart_details_cubit.dart';
import '../../utils/functions/snackbar.dart';
import '../../utils/export_utilities.dart';
part 'cart_item_tile.dart';
part 'cart_bottom_section.dart';
part 'promo.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    context.read<CartDetailsCubit>().getCartDetails();
    context.read<CartSummaryCubit>().getCartSummary();
    BlocProvider.of<AddressCubit>(context).getMyAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'Cart'),
      bottomNavigationBar: _CartBottomSection(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BlocConsumer<CartDetailsCubit, CartDetailsState>(
              listener: (BuildContext context, CartDetailsState state) {
                if (state is CartDetailsFailure) {
                  showSnackBar(context: context, msg: state.failure.message);
                }
                if (state is CartDetailsLoaded) {
                  context.read<CartSummaryCubit>().getCartSummary();
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
                      return item.quantity == 0
                          ? const SizedBox.shrink()
                          : _CartItemTile(
                              item: item,
                              onaddInc: () async {
                                BlocProvider.of<CartDetailsCubit>(context)
                                    .addProductToCart(
                                        state
                                            .cartDetaiilsModel.data![index].id!,
                                        state.cartDetaiilsModel.data![index]
                                            .quantity!,
                                        context.read<CartSummaryCubit>());
                              },
                              onRemoveItem: () async {
                                BlocProvider.of<CartDetailsCubit>(context)
                                    .removeCartItem(
                                        state
                                            .cartDetaiilsModel.data![index].id!,
                                        state.cartDetaiilsModel.data![index]
                                            .quantity!,
                                        context.read<CartSummaryCubit>());
                              },
                              onaddDec: () async {
                                BlocProvider.of<CartDetailsCubit>(context)
                                    .removeProductFromCart(
                                        state
                                            .cartDetaiilsModel.data![index].id!,
                                        state.cartDetaiilsModel.data![index]
                                            .quantity!,
                                        context.read<CartSummaryCubit>());
                              },
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
              'Apply a Coupon code!',
              size: 12,
              fontWeight: FontWeight.bold,
            ),
            sizedBoxHeight(20),
            BlocConsumer<CartSummaryCubit, CartSummaryState>(
              listener: (BuildContext context, CartSummaryState state) {
                if (state is CartSummaryFailure) {
                  showSnackBar(context: context, msg: state.failure.message);
                }
                if (state is CartSummaryLoaded) {
                  context.read<CouponCubit>().controller.text =
                      state.cartSummaryModel.couponCode!;
                }
              },
              builder: (BuildContext context, CartSummaryState state) {
                if (state is CartSummaryLoaded) {
                  return Column(
                    children: <Widget>[
                      _PromoContainer(),
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
