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
            if (state.wishlistModel.data!.isEmpty) {
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
              itemCount: state.wishlistModel.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Datum? datum = state.wishlistModel.data?[index];
                return ProductCard(
                  isWishlisted: state.wishlistModel.data?[index].isWishlisted,
                  onLike: () {
                    BlocProvider.of<FetchWishlistCubit>(context)
                        .addProductToWishlist(
                      state.wishlistModel.data![index].id!,
                    );
                  },
                  onDislike: () {
                    BlocProvider.of<FetchWishlistCubit>(context)
                        .removeProductFromWishlist(
                      state.wishlistModel.data![index].id!,
                    );
                    // BlocProvider.of<FetchWishlistCubit>(context)
                    //     .fetchWishlist();
                  },
                  productName: datum?.product?.name,
                  productImage: datum?.product?.thumbnailImage,
                  productId: datum?.id,
                  basePrice: datum?.product?.basePrice,
                  baseDiscountedPrice: datum?.product?.baseDiscountedPrice,
                  cartQuantity: datum?.product?.baseDiscountedPrice,
                );
              },
            );
          } else {
            return SubHeading2((state as FetchWishlistFailure).failure.message);
          }
        },
      ),
    );
  }
}
