import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

import '../../logic/product/recommended_product_cubit.dart';
import '../../logic/product/search_product_cubit.dart';
import '../../utils/export_utilities.dart';
import '../../utils/widgets/custom_image_widget.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: '', elevation: 0),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          _SearchField(),
          _SearchResultsBloc(),
          // Spacer(),
          _RecommendedProductsBloc(),
        ],
      ),
    );
  }
}

class _RecommendedProductsBloc extends StatefulWidget {
  const _RecommendedProductsBloc({
    Key? key,
  }) : super(key: key);

  @override
  State<_RecommendedProductsBloc> createState() =>
      _RecommendedProductsBlocState();
}

class _RecommendedProductsBlocState extends State<_RecommendedProductsBloc> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecommendedProductCubit>(context).getRecommendedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedProductCubit, RecommendedProductState>(
      builder: (BuildContext context, RecommendedProductState state) {
        if (state is RecommendedProductLoaded) {
          return ProductListBlock(
            height: 315,
            hideViewAll: true,
            title: 'Recommended',
            list: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: state.recommendedProductModel.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ProductCard(
                    onLike: () {
                      BlocProvider.of<RecommendedProductCubit>(context)
                          .addProductToWishlist(
                        state.recommendedProductModel.data![index].id!,
                      );
                    },
                    onDislike: () {
                      BlocProvider.of<RecommendedProductCubit>(context)
                          .removeProductFromWishlist(
                        state.recommendedProductModel.data![index].id!,
                      );
                      // BlocProvider.of<FetchWishlistCubit>(context)
                      //     .fetchWishlist();
                    },
                    productName:
                        state.recommendedProductModel.data?[index].name,
                    productImage:
                        state.recommendedProductModel.data?[index].thumbnailImg,
                    productId: state.recommendedProductModel.data?[index].id,
                    basePrice:
                        state.recommendedProductModel.data?[index].basePrice,
                    baseDiscountedPrice: state.recommendedProductModel
                        .data?[index].baseDiscountedPrice,
                    isWishlisted:
                        state.recommendedProductModel.data?[index].isWishlisted,
                    cartQuantity:
                        state.recommendedProductModel.data?[index].cartQuantity,
                    isAddedToCart: state.recommendedProductModel.data?[index]
                                .isAddedToCart ==
                            1
                        ? true
                        : false,
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _SearchResultsBloc extends StatelessWidget {
  const _SearchResultsBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductCubit, SearchProductState>(
      builder: (BuildContext context, SearchProductState state) {
        if (state is SearchProductInitial) {
          return Column(
            children: const <Widget>[
              CustomImageWidget(
                image: Assets.notSearch,
                scale: 2.5,
              ),
            ],
          );
        }
        if (state is SearchProductLoaded &&
            state.searchProductModel.data!.isEmpty) {
          return Column(
            children: const <Widget>[
              SubHeading1(
                'No result found',
                color: Colour.lightGrey,
              ),
            ],
          );
        }
        if (state is SearchProductLoaded) {
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: state.searchProductModel.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: ProductCard(
                  onLike: () {
                    BlocProvider.of<SearchProductCubit>(context)
                        .addProductToWishlist(
                      state.searchProductModel.data![index].id!,
                    );
                  },
                  onDislike: () {
                    BlocProvider.of<SearchProductCubit>(context)
                        .removeProductFromWishlist(
                      state.searchProductModel.data![index].id!,
                    );
                    // BlocProvider.of<FetchWishlistCubit>(context)
                    //     .fetchWishlist();
                  },
                  productName: state.searchProductModel.data?[index].name,
                  productImage:
                      state.searchProductModel.data?[index].thumbnailImg,
                  productId: state.searchProductModel.data?[index].id,
                  basePrice: state.searchProductModel.data?[index].basePrice,
                  baseDiscountedPrice: state
                      .searchProductModel.data?[index].baseDiscountedPrice,
                  isWishlisted:
                      state.searchProductModel.data?[index].isWishlisted,
                  cartQuantity:
                      state.searchProductModel.data?[index].cartQuantity,
                  isAddedToCart:
                      state.searchProductModel.data?[index].isAddedToCart == 1
                          ? true
                          : false,
                ),
              );
            },
          );
        }

        if (state is SearchProductFailure) {
          return Column(
            children: <Widget>[
              SubHeading1(
                state.failure.message,
                color: Colour.lightGrey,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  void onChange(String? onChangeText) {
    if (onChangeText != null && onChangeText.length >= 3) {
      context.read<SearchProductCubit>().searchProduct(onChangeText);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    return Container(
      color: Colour.darkBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: CustomTextField(
          controller: _textEditingController,
          onChanged: (String? onChangeText) {
            onChange(onChangeText);
          },
          autofocus: true,
          filled: true,
          fillColor: Colour.white,
          borderColor: Colour.transparent,
          borderRadius: 100,
          errorBorderRadius: 50,
          enabledBorderRadius: 50,
          focusBorderRadius: 50,
          disabledBorderRadius: 50,
          enabledBorderColor: Colour.transparent,
          disabledBorderColor: Colour.transparent,
          hintText: 'Search your drink here...',
          hintStyle: const TextStyle(
            color: Colour.black,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(14.0),
            child: CustomImageWidget(
              image: Assets.search,
              scale: 5,
              color: Colour.black,
            ),
          ),
          suffixIcon: InkWell(
            onTap: () {
              _textEditingController.clear();
            },
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: CustomImageWidget(
                image: Assets.close,
                scale: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
