import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/banners/banners_cubit.dart';
import '../../logic/combos/combos_cubit.dart';
import '../../logic/best_sellers/bestsellers_cubit.dart';
import '../../logic/new_products/new_products_cubit.dart';
import '../../logic/category/category_cubit.dart';
import '../../utils/widgets/loading_indicator.dart';
import '../sidebar/sidebar.dart';
import '../../utils/export_utilities.dart';
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
part 'whats_new.dart';
part 'best_sellers.dart';
part 'combos.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      drawer: const Sidebar(),
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
            sizedBoxHeight(10),
            const _BestSellers(),
            sizedBoxHeight(10),
            const _WhatsNew(),
            sizedBoxHeight(10),
            const _Combos(),
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
