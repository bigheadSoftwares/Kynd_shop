import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/wishlist/wishlist_model/datum.dart';
import '../../logic/wishlist/fetch_wishlist_cubit.dart';
import '../../utils/widgets/product_card.dart';
import '../../utils/export_utilities.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchWishlistCubit>(context).fetchWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'Wishlist'),
      body: BlocBuilder<FetchWishlistCubit, FetchWishlistState>(
        builder: (BuildContext context, FetchWishlistState state) {
          if (state is FetchWishlistInitial) {
            return const LoadingIndicator();
          } else if (state is FetchWishlistLoaded) {
            if (state.wishlistModel.data!
                .where((Datum element) => element.isWishlisted == 1)
                .isEmpty) {
              return const Center(
                child: SubHeading2(
                  'Nothing in wishlist',
                ),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: state.wishlistModel.data
                      ?.where((Datum element) => element.isWishlisted == 1)
                      .length ??
                  0,
              itemBuilder: (BuildContext context, int index) {
                Datum? datum = state.wishlistModel.data
                    ?.where((Datum element) => element.isWishlisted == 1)
                    .toList()[index];
                return ProductCard(
                  isWishlisted: datum?.isWishlisted,
                  onLike: () {
                    BlocProvider.of<FetchWishlistCubit>(context)
                        .addProductToWishlist(
                      datum!.product!.productId!,
                    );
                  },
                  onDislike: () {
                    BlocProvider.of<FetchWishlistCubit>(context)
                        .removeProductFromWishlist(
                      datum!.product!.productId!,
                    );
                    // BlocProvider.of<FetchWishlistCubit>(context)
                    //     .fetchWishlist();
                  },
                  productName: datum?.product?.name,
                  productImage: datum?.product?.thumbnailImage,
                  productId: datum?.product!.productId,
                  basePrice: datum?.product?.basePrice,
                  baseDiscountedPrice: datum?.product?.baseDiscountedPrice,
                  cartQuantity: datum?.product?.baseDiscountedPrice,
                );
              },
            );
          } else {
            return Center(
                child: SubHeading2(
                    (state as FetchWishlistFailure).failure.message));
          }
        },
      ),
    );
  }
}
