import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/categories/sub_category_products_model/datum.dart';
import '../../logic/category/sub_category_products_cubit.dart';
import '../../logic/filter/selected_filter_cubit.dart';
import '../../utils/export_utilities.dart';

class PopularBrandProducts extends StatefulWidget {
  final int brandId;
  const PopularBrandProducts({
    Key? key,
    required this.brandId,
  }) : super(key: key);

  @override
  State<PopularBrandProducts> createState() => _PopularBrandProductsState();
}

class _PopularBrandProductsState extends State<PopularBrandProducts> {
  @override
  void initState() {
    super.initState();
    context.read<SelectedFilterCubit>().updateBrandSet(<int>{widget.brandId});
    BlocProvider.of<SubCategoryProductsCubit>(context).getSubCategoryProducts(
      selectedFilterModel: context.read<SelectedFilterCubit>().state,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: ''),
      body: BlocBuilder<SubCategoryProductsCubit, SubCategoryProductsState>(
        builder: (BuildContext context, SubCategoryProductsState state) {
          if (state is SubCategoryProductsLoaded) {
            if (state.subCategoryProductsModel.data == null ||
                state.subCategoryProductsModel.data!.isEmpty) {
              return const Center(child: SubHeading2('Nothing Available'));
            }
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: state.subCategoryProductsModel.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Datum? datum = state.subCategoryProductsModel.data?[index];
                return ProductCard(
                  isWishlisted:
                      state.subCategoryProductsModel.data?[index].isWishlisted,
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
                            state.subCategoryProductsModel.data![index].id!,
                            state.subCategoryProductsModel.data![index]
                                .cartQuantity!);
                  },
                  onIncTap: () async {
                    BlocProvider.of<SubCategoryProductsCubit>(context)
                        .addProductToCart(
                            state.subCategoryProductsModel.data![index].id!,
                            state.subCategoryProductsModel.data![index]
                                .cartQuantity!);
                  },
                  onDecTap: () async {
                    BlocProvider.of<SubCategoryProductsCubit>(context)
                        .removeProductFromCart(
                            state.subCategoryProductsModel.data![index].id!,
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
    );
  }
}
