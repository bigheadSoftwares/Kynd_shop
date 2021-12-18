import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kynd_shop/logic/cart/add_to_cart_cubit.dart';
import '../../data/categories/sub_category_products_model/datum.dart';
import '../../utils/export_utilities.dart';

import '../../logic/category/sub_category_cubit.dart';
import '../../logic/category/sub_category_products_cubit.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/custom_image_widget.dart';
import '../../utils/widgets/product_card.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);
  final String categoryName;
  final int categoryId;

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SubCategoryCubit>(context).getSubCategory(
      widget.categoryId,
    );
    BlocProvider.of<SubCategoryProductsCubit>(context)
        .getSubCategoryProducts(4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
          context,
          title: widget.categoryName,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                // push(context, const Search());
              },
              color: Colour.white,
              icon: const Padding(
                padding: EdgeInsets.all(6.0),
                child: CustomImageWidget(
                  image: Assets.search1,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // push(context, const Filter());
              },
              color: Colour.white,
              icon: const Padding(
                padding: EdgeInsets.all(6.0),
                child: CustomImageWidget(
                  image: Assets.filter,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<SubCategoryCubit, SubCategoryState>(
          builder: (BuildContext context, SubCategoryState state) {
            if (state is SubCategoryLoaded) {
              if (state.subCategoryModel.data!.isEmpty) {
                return const Center(child: SubHeading2('Nothing Available'));
              }
              return DefaultTabController(
                length: state.subCategoryModel.data?.length ?? 0,
                child: Column(
                  children: <Widget>[
                    _Tabs(
                      state: state,
                    ),
                    _TabView(
                      tabLength: state.subCategoryModel.data?.length ?? 0,
                    ),
                  ],
                ),
              );
            } else {
              return const Scaffold(
                body: LoadingIndicator(),
              );
            }
          },
        ));
  }
}

class _TabView extends StatefulWidget {
  const _TabView({
    Key? key,
    required this.tabLength,
  }) : super(key: key);
  final int tabLength;

  @override
  State<_TabView> createState() => _TabViewState();
}

class _TabViewState extends State<_TabView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: <Widget>[
          ...List<Widget>.generate(
            widget.tabLength,
            (int index) =>
                BlocBuilder<SubCategoryProductsCubit, SubCategoryProductsState>(
              builder: (BuildContext context, SubCategoryProductsState state) {
                if (state is SubCategoryProductsLoaded) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.48,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: state.subCategoryProductsModel.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      Datum? datum =
                          state.subCategoryProductsModel.data?[index];
                      return ProductCard(
                        isWishlisted: state
                            .subCategoryProductsModel.data?[index].isWishlisted,
                        onLike: () {
                          BlocProvider.of<SubCategoryProductsCubit>(context)
                              .addProductToWishlist(
                            state.subCategoryProductsModel.data![index].id!,
                          );
                        },
                        onDislike: () {
                          BlocProvider.of<SubCategoryProductsCubit>(context)
                              .removeProductFromWishlist(
                            state.subCategoryProductsModel.data![index].id!,
                          );
                        },
                        onAddToCart: () async {
                          BlocProvider.of<SubCategoryProductsCubit>(context)
                              .addProductToCart(
                                  state.subCategoryProductsModel.data![index]
                                      .id!,
                                  state.subCategoryProductsModel.data![index]
                                      .cartQuantity!);
                        },
                        onIncTap: () async {
                          BlocProvider.of<SubCategoryProductsCubit>(context)
                              .addProductToCart(
                                  state.subCategoryProductsModel.data![index]
                                      .id!,
                                  state.subCategoryProductsModel.data![index]
                                      .cartQuantity!);
                        },
                        onDecTap: () async {
                          BlocProvider.of<SubCategoryProductsCubit>(context)
                              .removeProductFromCart(
                                  state.subCategoryProductsModel.data![index]
                                      .id!,
                                  state.subCategoryProductsModel.data![index]
                                      .cartQuantity!);
                        },
                        productName: datum?.name,
                        productImage: datum?.thumbnailImg,
                        productId: datum?.id,
                        basePrice: datum?.basePrice,
                        baseDiscountedPrice: datum?.baseDiscountedPrice,
                        cartQuantity: datum?.cartQuantity,
                        isAddedToCart: datum?.isAddedToCart == 0 ? false : true,
                      );
                    },
                  );
                } else if (state is SubCategoryProductsInitial) {
                  return const LoadingIndicator();
                } else {
                  return SubHeading2(
                    (state as SubCategoryProductsFailure).failure.message,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    Key? key,
    required this.state,
  }) : super(key: key);
  final SubCategoryLoaded state;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colour.greenishBlue,
        indicatorWeight: 3,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelColor: Colour.greenishBlue,
        unselectedLabelColor: Colour.black,
        tabs: <Widget>[
          ...List<Tab>.generate(
            state.subCategoryModel.data?.length ?? 0,
            (int index) => Tab(
              text: state.subCategoryModel.data?[index].name ?? '',
            ),
          )
        ],
      ),
    );
  }
}
