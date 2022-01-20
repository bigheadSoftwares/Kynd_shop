import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../functions/snackbar.dart';

import '../../view/product_detail/product_detail.dart';
import '../export_utilities.dart';
import 'add_to_cart_widget.dart';
import 'cut_mrp.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      this.productName,
      this.productImage,
      this.basePrice,
      this.productId,
      this.baseDiscountedPrice,
      this.isAddedToCart,
      this.cartQuantity,
      this.isWishlisted = 0,
      this.onAddToCart,
      this.onLike,
      this.onDislike,
      this.onDecTap,
      this.onIncTap})
      : super(key: key);
  final String? productName;
  final String? productImage;
  final int? basePrice;
  final int? productId;
  final int? baseDiscountedPrice;
  final bool? isAddedToCart;
  final int? cartQuantity;
  final int? isWishlisted;
  final VoidCallback? onAddToCart;
  final VoidCallback? onLike;
  final VoidCallback? onDislike;
  final VoidCallback? onIncTap;
  final VoidCallback? onDecTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colour.white,
      elevation: 2,
      borderRadius: BorderRadius.circular(6),
      child: RoundContainer(
        onTap: () {
          push(
              context,
              ProductDetail(
                productId: productId,
                isAddedToCart: isAddedToCart,
                cartQuantity: cartQuantity,
                productPrice: baseDiscountedPrice,
              ));
        },
        width: 170,
        hPadding: 0,
        vPadding: 0,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CustomNetworkImageWidget(
                      image: productImage ?? '', height: 140),
                ),
                const Divider(),
                SizedBox(
                  height: 125,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: SubHeading2(
                            productName ?? '',
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        sizedBoxHeight(4),
                        CutMrp(mrp: basePrice ?? baseDiscountedPrice ?? 0),
                        sizedBoxHeight(4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SubHeading2(
                              '${Constants.rupee} ${baseDiscountedPrice ?? 'NA'}/-',
                              fontWeight: FontWeight.w500,
                            ),
                            isAddedToCart == true && cartQuantity != 0
                                ? IncrementDecrementButton(
                                    number: cartQuantity ?? 1,
                                    onTapInc: onIncTap,
                                    onTapDec: onDecTap,
                                  )
                                : AddToCartWidget(
                                    onAddToCart: Constants.isSkipped ||
                                            !Constants.isLoggedIn
                                        ? () {
                                            showSnackBar(
                                                context: context,
                                                msg:
                                                    'Please login to use complete functionality');
                                          }
                                        : onAddToCart,
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: isWishlisted == 1
                  ? IconButton(
                      onPressed: onDislike,
                      icon: const Icon(
                        Icons.favorite,
                        color: Colour.red,
                        size: 26,
                      ),
                    )
                  : IconButton(
                      onPressed: Constants.isSkipped
                          ? () {
                              showSnackBar(
                                  context: context,
                                  msg:
                                      'Please login to use complete functionality');
                            }
                          : onLike,
                      icon: const Icon(
                        Icons.favorite_outline_rounded,
                        color: Colour.lightGrey,
                        size: 26,
                      ),
                    ),
            ),
            // Positioned(
            //   top: 5,
            //   left: -5,
            //   // alignment: Alignment.topLeft,
            //   child: Transform.scale(
            //     scale: 0.6,
            //     child: const Points(points: 7),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
