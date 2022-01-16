part of 'product_detail.dart';

class _BottomCartSection extends StatefulWidget {
  const _BottomCartSection({
    Key? key,
    this.productPrice,
    this.isAddedToCart,
    this.cartQuantity,
    this.productId,
  }) : super(key: key);
  final int? productPrice;
  final bool? isAddedToCart;
  final int? cartQuantity;
  final int? productId;
  @override
  State<_BottomCartSection> createState() => _BottomCartSectionState();
}

class _BottomCartSectionState extends State<_BottomCartSection> {
  bool? isAddedToCart = false;
  int? cartQuantity;
  int? productPrice;
  int? productId;

  @override
  void initState() {
    super.initState();
    isAddedToCart = widget.isAddedToCart;
    cartQuantity = widget.cartQuantity;
    productPrice = widget.productPrice;
    productId = widget.productId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (BuildContext context, ProductDetailState state) {
        return Material(
          elevation: 10,
          color: Colour.white,
          child: state is ProductDetailLoaded
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          state.productDetailModel.data![0].isAddedToCart ==
                                      true &&
                                  state.productDetailModel.data![0]
                                          .cartQuantity !=
                                      0
                              ? IncrementDecrementButton(
                                  number: state.productDetailModel.data![0]
                                      .cartQuantity!,
                                  onTapInc: Constants.isSkipped
                                      ? () {
                                          showSnackBar(
                                              context: context,
                                              msg:
                                                  'Please login to use complete functionality');
                                        }
                                      : () async {
                                          BlocProvider.of<ProductDetailCubit>(
                                                  context)
                                              .addProductToCart(
                                                  productId!,
                                                  state.productDetailModel
                                                      .data![0].cartQuantity!);
                                        },
                                  onTapDec: Constants.isSkipped
                                      ? () {
                                          showSnackBar(
                                              context: context,
                                              msg:
                                                  'Please login to use complete functionality');
                                        }
                                      : () async {
                                          BlocProvider.of<ProductDetailCubit>(
                                                  context)
                                              .removeProductFromCart(
                                                  productId!,
                                                  state.productDetailModel
                                                      .data![0].cartQuantity!);
                                        },
                                )
                              : AddToCartWidget(
                                  onAddToCart: Constants.isSkipped
                                      ? () {
                                          showSnackBar(
                                              context: context,
                                              msg:
                                                  'Please login to use complete functionality');
                                        }
                                      : () {
                                          BlocProvider.of<ProductDetailCubit>(
                                                  context)
                                              .addProductToCart(
                                                  productId!,
                                                  state.productDetailModel
                                                      .data![0].cartQuantity!);
                                        }),
                          SubHeading2(
                            '${Constants.rupee} $productPrice/-',
                            color: Colour.greenishBlue,
                            fontWeight: FontWeight.w500,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      child: RoundContainer(
                        onTap: () {
                          pushReplacementNamed(context, Routes.cart);
                        },
                        hPadding: 10,
                        vPadding: 10,
                        radius: 30,
                        color: Colour.greenishBlue,
                        width: double.infinity,
                        child: const Center(
                          child: SubHeading1(
                            'Go to Cart',
                            color: Colour.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : sizedBoxHeight(20),
        );
      },
    );
  }
}
