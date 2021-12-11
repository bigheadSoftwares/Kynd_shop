import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

import '../export_utilities.dart';
import 'custom_image_widget.dart';
import 'cut_mrp.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.productName,
    this.productImage,
    this.basePrice,
    this.baseDiscountedPrice,
    this.productId,
    this.isAddedToCart,
    this.cartQuantity, this.onAddToCart,
  }) : super(key: key);
  final String? productName;
  final String? productImage;
  final int? basePrice;
  final int? productId;
  final int? baseDiscountedPrice;
  final bool? isAddedToCart;
  final int? cartQuantity;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colour.white,
      elevation: 2,
      borderRadius: BorderRadius.circular(6),
      child: RoundContainer(
        onTap: () {
          pushNamed(
            context,
            Routes.productDetail,
            arguments: productId,
          );
        },
        width: 200,
        hPadding: 0,
        vPadding: 0,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomImageWidget(image: Assets.beer, height: 140),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SubHeading2(
                        productName ?? '',
                        fontWeight: FontWeight.w500,
                      ),
                      sizedBoxHeight(4),
                      CutMrp(mrp: basePrice ?? baseDiscountedPrice ?? 500),
                      sizedBoxHeight(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SubHeading2(
                            '${Constants.rupee} ${baseDiscountedPrice ?? '400'}/-',
                            fontWeight: FontWeight.w500,
                          ),
                          isAddedToCart == true
                              ? IncrementDecrementButton(
                                  number: cartQuantity ?? 1,
                                )
                              : RoundContainer(
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
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: Colour.lightGrey,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: -5,
              // alignment: Alignment.topLeft,
              child: Transform.scale(
                scale: 0.6,
                child: const Points(points: 7),
              ),
            )
          ],
        ),
      ),
    );
  }
}
