part of 'cart.dart';

class _PromoContainer extends StatefulWidget {
  _PromoContainer({
    Key? key,
  }) : super(key: key);
  @override
  State<_PromoContainer> createState() => _PromoContainerState();
}

class _PromoContainerState extends State<_PromoContainer> {
  bool isCoupnApplied = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: DottedBorder(
        color: Colour.lightGrey.withOpacity(0.5),
        dashPattern: const <double>[5, 5],
        child: Row(
          children: <Widget>[
            Expanded(
              child: CustomTextField(
                controller: context.read<CouponCubit>().controller,
                readOnly: true,
              ),
            ),
            context.read<CouponCubit>().controller.text == ''
                ? CouponButton(
                    couponText: 'See Coupons',
                    onTap: () {
                      push(
                        context,
                        const CouponList(),
                      );
                    },
                  )
                : BlocConsumer<CouponRemoveCubit, CouponRemoveState>(
                    listener: (BuildContext context, CouponRemoveState state) {
                      if (state is CouponRemoveSuccess) {
                        context.read<CartSummaryCubit>().getCartSummary();
                      }
                      if (state is CouponRemoveFailure) {
                        showToast(state.failure.message);
                      }
                    },
                    builder: (BuildContext context, CouponRemoveState state) {
                      return state is CouponRemoveLoading
                          ? const LoadingIndicator()
                          : CouponButton(
                              couponText: 'Remove',
                              color: Colour.red,
                              onTap: () {
                                context
                                    .read<CouponRemoveCubit>()
                                    .removeCoupon();
                              },
                            );
                    },
                  ),
            sizedBoxWidth(15)
          ],
        ),
      ),
    );
  }
}

class CouponButton extends StatelessWidget {
  const CouponButton({
    Key? key,
    required this.couponText,
    required this.onTap,
    this.color,
  }) : super(key: key);

  final String couponText;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      onTap: onTap,
      height: 22,
      hPadding: 20,
      vPadding: 0,
      radius: 6,
      color: color ?? Colour.greenishBlue,
      child: SubHeading2(
        couponText,
        size: 12,
        fontWeight: FontWeight.bold,
        color: Colour.white,
      ),
    );
  }
}
