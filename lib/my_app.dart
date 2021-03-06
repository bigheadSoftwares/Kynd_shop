import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/feedback_cubit/feedback_cubit.dart';
import 'logic/points_earned/points_earned_cubit.dart';
import 'logic/filter/selected_filter_cubit.dart';
import 'logic/order/create_order_cubit.dart';
import 'logic/product/recommended_product_cubit.dart';
import 'logic/user_status/user_status_cubit.dart';
import 'logic/address/make_default_cubit.dart';
import 'logic/blog/add_blog_comment_cubit.dart';
import 'logic/blog/blog_comments_cubit.dart';
import 'logic/coupon/apply_coupon_cubit.dart';
import 'logic/coupon/coupon_cubit.dart';
import 'logic/coupon/coupon_remove_cubit.dart';
import 'logic/address/address_cubit.dart';
import 'logic/address/create_address_cubit.dart';
import 'logic/cart/cart_summary_cubit.dart';
import 'logic/cart/cart_details_cubit.dart';
import 'logic/product/search_product_cubit.dart';
import 'logic/blog/blog_cubit.dart';
import 'logic/image_picking/image_picking_cubit.dart';
import 'utils/export_utilities.dart';
import 'logic/authentication/authentication_cubit.dart';
import 'logic/order/order_detail_cubit.dart';
import 'logic/category/sub_category_cubit.dart';
import 'logic/category/sub_category_products_cubit.dart';
import 'logic/order/order_list_cubit.dart';
import 'logic/product/product_detail_cubit.dart';
import 'logic/wishlist/fetch_wishlist_cubit.dart';
import 'logic/banners/banners_cubit.dart';
import 'logic/combos/combos_cubit.dart';
import 'logic/location/location_cubit.dart';
import 'logic/brands/brands_cubit.dart';
import 'logic/best_sellers/bestsellers_cubit.dart';
import 'logic/new_products/new_products_cubit.dart';
import 'logic/category/category_cubit.dart';
import 'logic/theme/theme_cubit.dart';
import 'logic/user/user_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<CategoryCubit>(
          create: (BuildContext context) => CategoryCubit(),
        ),
        BlocProvider<BrandsCubit>(
          create: (BuildContext context) => BrandsCubit(),
        ),
        BlocProvider<NewProductsCubit>(
          create: (BuildContext context) => NewProductsCubit(),
        ),
        BlocProvider<BestsellersCubit>(
          create: (BuildContext context) => BestsellersCubit(),
        ),
        BlocProvider<CombosCubit>(
          create: (BuildContext context) => CombosCubit(),
        ),
        BlocProvider<BannersCubit>(
          create: (BuildContext context) => BannersCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (BuildContext context) => LocationCubit(),
        ),
        BlocProvider<AuthenticationCubit>(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<FetchWishlistCubit>(
          create: (BuildContext context) => FetchWishlistCubit(),
        ),
        BlocProvider<ProductDetailCubit>(
          create: (BuildContext context) => ProductDetailCubit(),
        ),
        BlocProvider<CartDetailsCubit>(
          create: (BuildContext context) => CartDetailsCubit(),
        ),
        BlocProvider<CartSummaryCubit>(
          create: (BuildContext context) => CartSummaryCubit(),
        ),
        BlocProvider<OrderListCubit>(
          create: (BuildContext context) => OrderListCubit(),
        ),
        BlocProvider<SubCategoryCubit>(
          create: (BuildContext context) => SubCategoryCubit(),
        ),
        BlocProvider<SubCategoryProductsCubit>(
          create: (BuildContext context) => SubCategoryProductsCubit(),
        ),
        BlocProvider<OrderDetailCubit>(
          create: (BuildContext context) => OrderDetailCubit(),
        ),
        BlocProvider<AddressCubit>(
          create: (BuildContext context) => AddressCubit(),
        ),
        BlocProvider<UserStatusCubit>(
          create: (BuildContext context) => UserStatusCubit(),
        ),
        BlocProvider<CreateAddressCubit>(
          create: (BuildContext context) => CreateAddressCubit(),
        ),
        BlocProvider<BlogCubit>(
          create: (BuildContext context) => BlogCubit(),
        ),
        BlocProvider<MakeDefaultCubit>(
          create: (BuildContext context) => MakeDefaultCubit(),
        ),
        BlocProvider<BlogCommentsCubit>(
          create: (BuildContext context) => BlogCommentsCubit(),
        ),
        BlocProvider<AddBlogCommentCubit>(
          create: (BuildContext context) => AddBlogCommentCubit(),
        ),
        BlocProvider<ImagePickingCubit>(
          create: (BuildContext context) => ImagePickingCubit(),
        ),
        BlocProvider<SearchProductCubit>(
          create: (BuildContext context) => SearchProductCubit(),
        ),
        BlocProvider<CouponCubit>(
          create: (BuildContext context) => CouponCubit(),
        ),
        BlocProvider<ApplyCouponCubit>(
          create: (BuildContext context) => ApplyCouponCubit(),
        ),
        BlocProvider<CouponRemoveCubit>(
          create: (BuildContext context) => CouponRemoveCubit(),
        ),
        BlocProvider<CreateOrderCubit>(
            create: (BuildContext context) => CreateOrderCubit()),
        BlocProvider<RecommendedProductCubit>(
          create: (BuildContext context) => RecommendedProductCubit(),
        ),
        BlocProvider<SelectedFilterCubit>(
          create: (BuildContext context) => SelectedFilterCubit(),
        ),
        BlocProvider<PointsEarnedCubit>(
          create: (BuildContext context) => PointsEarnedCubit(),
        ),
        BlocProvider<FeedbackCubit>(
          create: (BuildContext context) => FeedbackCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (BuildContext context, ThemeData state) {
          return CustomMaterial(
            state: state,
          );
        },
      ),
    );
  }
}

class CustomMaterial extends StatelessWidget {
  const CustomMaterial({Key? key, required this.state}) : super(key: key);
  final ThemeData state;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kynd Shop',
      theme: state,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: Constants.navigatorKey,
    );
  }
}
