import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';
import 'custom_image_widget.dart';
import 'cut_mrp.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(6),
      child: RoundContainer(
        onTap: () {
          pushNamed(context, Routes.productDetail);
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
                    children: <Widget>[
                      const SubHeading2(
                        'Kingfisher Premium Beer 330 ml',
                        fontWeight: FontWeight.w500,
                      ),
                      sizedBoxHeight(6),
                      const CutMrp(mrp: 232),
                      sizedBoxHeight(6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SubHeading2(
                            '\$335.00/-',
                            fontWeight: FontWeight.w500,
                          ),
                          RoundContainer(
                            onTap: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
