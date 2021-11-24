import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/product_list.dart';
import '../../utils/widgets/title.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/widgets/custom_image_widget.dart';

part 'top_header.dart';
part 'carousel.dart';
part 'explore_category.dart';
part 'popular_brands.dart';
part 'footer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TopHeader(),
            sizedBoxHeight(10),
            SizedBox(
              height: 180,
              width: screenWidth(context),
              child: const CarouselWithIndicatorDemo(),
            ),
            sizedBoxHeight(20),
            const _ExploreCategory(),
            ProductListBlock(
              title: 'Bestsellers',
              onTap: () {},
            ),
            sizedBoxHeight(10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colour.offWhite,
              child: ProductListBlock(
                title: "What's New",
                onTap: () {},
              ),
            ),
            sizedBoxHeight(10),
            ProductListBlock(
              title: 'Combos',
              onTap: () {},
            ),
            sizedBoxHeight(20),
            const _PopularBrands(),
            sizedBoxHeight(20),
            const _Footer()
          ],
        ),
      ),
    );
  }
}


