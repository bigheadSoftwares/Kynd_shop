import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kynd_shop/logic/cart/cart_details_cubit.dart';
import '../../logic/user/user_cubit.dart';
import '../../logic/filter/selected_filter_cubit.dart';
import 'popular_brand_products.dart';
import '../../data/address/my_addresses_model/datum.dart';
import '../../logic/address/address_cubit.dart';
import '../../logic/user_status/user_status_cubit.dart';
import 'view_all_grid.dart';
import '../../logic/banners/banners_cubit.dart';
import '../../logic/combos/combos_cubit.dart';
import '../../data/brands/brands_repo.dart';
import '../../logic/brands/brands_cubit.dart';
import '../../logic/best_sellers/bestsellers_cubit.dart';
import '../../logic/new_products/new_products_cubit.dart';
import '../../logic/category/category_cubit.dart';
import '../sidebar/sidebar.dart';
import '../../utils/export_utilities.dart';

part 'top_header.dart';
part 'carousel.dart';
part 'explore_category.dart';
part 'popular_brands.dart';
part 'footer.dart';
part 'whats_new.dart';
part 'best_sellers.dart';
part 'combos.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    if (Constants.isLoggedIn) {
      context.read<UserCubit>().getUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      drawer: Constants.isLoggedIn ? const Sidebar() : const SizedBox(),
      body: RefreshIndicator(
        color: Colour.greenishBlue,
        onRefresh: () async {
          getAllProducts(context);
        },
        child: SingleChildScrollView(
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
              sizedBoxHeight(10),
              const _ExploreCategory(),
              sizedBoxHeight(15),
              const _BestSellers(),
              sizedBoxHeight(10),
              const _WhatsNew(),
              sizedBoxHeight(10),
              const _Combos(),
              sizedBoxHeight(0),
              const _PopularBrands(),
              sizedBoxHeight(20),
              const _Footer()
            ],
          ),
        ),
      ),
    );
  }
}

void getAllProducts(BuildContext context) {
  context.read<BannersCubit>().getBanners();
  context.read<CategoryCubit>().getDrinkCategories();
  context.read<BestsellersCubit>().getBestSellers();
  context.read<NewProductsCubit>().getNewProducts();
  context.read<CombosCubit>().getCombos();
  context.read<BrandsCubit>().fetchBrands();
}
