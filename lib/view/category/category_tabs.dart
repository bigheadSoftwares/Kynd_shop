import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/filter/selected_filter_cubit.dart';
import '../../data/categories/sub_category_products_model/datum.dart';
import '../../utils/export_utilities.dart';

import '../../logic/category/sub_category_cubit.dart';
import '../../logic/category/sub_category_products_cubit.dart';

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
              pushNamed(context, Routes.search);
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
              pushNamed(context, Routes.filter);
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
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
                      childAspectRatio: 0.55,
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

class _Tabs extends StatefulWidget {
  const _Tabs({
    Key? key,
    required this.state,
  }) : super(key: key);
  final SubCategoryLoaded state;

  @override
  State<_Tabs> createState() => _TabsState();
}

class _TabsState extends State<_Tabs> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    getSubCategoryProducts();
    super.initState();
    _tabController = TabController(
        length: widget.state.subCategoryModel.data?.length ?? 0, vsync: this);
    _tabController.addListener(() {
      context.read<SelectedFilterCubit>().currentCategoryTabId =
          widget.state.subCategoryModel.data![_tabController.index].id!;
      getSubCategoryProducts();
    });
  }

  void getSubCategoryProducts() {
    context.read<SelectedFilterCubit>().currentCategoryTabId =
        widget.state.subCategoryModel.data![0].id!;
    BlocProvider.of<SubCategoryProductsCubit>(context).getSubCategoryProducts(
      context.read<SelectedFilterCubit>().currentCategoryTabId,
      selectedFilterModel: context.read<SelectedFilterCubit>().state,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: Colour.greenishBlue,
        indicatorWeight: 3,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelColor: Colour.greenishBlue,
        unselectedLabelColor: Colour.black,
        tabs: <Widget>[
          ...List<Tab>.generate(
            widget.state.subCategoryModel.data?.length ?? 0,
            (int index) {
              return Tab(
                text: widget.state.subCategoryModel.data?[index].name ?? '',
              );
            },
          )
        ],
      ),
    );
  }
}
