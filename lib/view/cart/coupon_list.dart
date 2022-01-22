import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cart/cart_summary_cubit.dart';
import '../../logic/coupon/apply_coupon_cubit.dart';
import '../../data/coupon/coupon_model/datum.dart';
import '../../utils/functions/snackbar.dart';
import '../../logic/coupon/coupon_cubit.dart';
import '../../utils/export_utilities.dart';

class CouponList extends StatefulWidget {
  const CouponList({Key? key}) : super(key: key);

  @override
  State<CouponList> createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  @override
  void initState() {
    super.initState();
    context.read<CouponCubit>().getCoupnList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      appBar: appBar(context, title: 'Coupons'),
      body: BlocConsumer<CouponCubit, CouponState>(
        listener: (BuildContext context, CouponState state) {
          if (state is CouponFailure) {
            showSnackBar(context: context, msg: state.failure.message);
          }
        },
        builder: (BuildContext context, CouponState state) {
          return state is CouponLoaded
              ? state.coupnModel.data!.isEmpty
                  ? const Center(
                      child: SubHeading1('No Coupons found'),
                    )
                  : Stack(
                      children: <Widget>[
                        const BackgroundImageWidget(
                          backgroundImage: Assets.registerBackground,
                        ),
                        BlocListener<ApplyCouponCubit, ApplyCouponState>(
                          listener:
                              (BuildContext ctx, ApplyCouponState couponState) {
                            if (couponState is ApplyCouponSuccess) {
                              showToast('Coupon Applied Successfully');
                              context.read<CartSummaryCubit>().getCartSummary();
                              pop(context);
                            } else if (couponState is ApplyCouponFailure) {
                              showSnackBar(
                                  context: context,
                                  msg: couponState.failure.message);
                            }
                          },
                          child: ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                                10, screenHeight(context) * 0.04, 10, 40),
                            itemCount: state.coupnModel.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Datum coupon = state.coupnModel.data![index];
                              DateTime now = DateTime.now();
                              DateTime couponEndDate = DateTime.parse(
                                  state.coupnModel.data![index].endDate!);
                              return couponEndDate.isAfter(now)
                                  ? RoundContainer(
                                      padding: const EdgeInsets.all(20),
                                      color: Colour.white,
                                      child: CustomListTile(
                                        title: SubHeading1(
                                          coupon.code!,
                                          size: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        subtitle: SubHeading2(
                                          'Get upto ${Constants.rupee} ${coupon.maxDiscount} off on minimum purcahse of ${Constants.rupee} ${coupon.minBuy}',
                                          size: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        trailing: RoundContainer(
                                          onTap: () {
                                            context
                                                .read<ApplyCouponCubit>()
                                                .applyCoupon(coupon.code!);
                                          },
                                          height: 30,
                                          hPadding: 25,
                                          vPadding: 0,
                                          radius: 6,
                                          color: Colour.greenishBlue,
                                          child: const Center(
                                            child: SubHeading2(
                                              'Apply',
                                              size: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colour.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ).outerNeumorphism()
                                  : const SizedBox.shrink();
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return sizedBoxHeight(10);
                            },
                          ),
                        ),
                      ],
                    )
              : state is CouponFailure
                  ? const Center(
                      child: SubHeading1('Something went wrong'),
                    )
                  : const LoadingIndicator();
        },
      ),
    );
  }
}
