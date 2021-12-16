part of 'home.dart';

class _BestSellers extends StatefulWidget {
  const _BestSellers({Key? key}) : super(key: key);

  @override
  State<_BestSellers> createState() => _BestSellersState();
}

class _BestSellersState extends State<_BestSellers> {
  @override
  void initState() {
    super.initState();
    context.read<BestsellersCubit>().getBestSellers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestsellersCubit, BestsellersState>(
      builder: (BuildContext context, BestsellersState state) {
        if (state is BestsellersInitial) {
          return const ShimmerBox(
            height: 140,
            width: 150,
            itemCount: 4,
          );
        } else if (state is BestsellersLoaded) {
          return ProductListBlock(
            title: 'Bestsellers',
            onTap: () {},
            list: BlocProvider<AddToCartCubit>(
              create: (BuildContext context) => AddToCartCubit(),
              child: BlocListener<AddToCartCubit, AddToCartState>(
                listener: (BuildContext context, AddToCartState state) {
                  if (state is AddToCartLoaded) {
                    context.read<BestsellersCubit>().getBestSellers();
                  } else if (state is AddToCartFailure) {
                    showSnackBar(context: context, msg: state.failure.message);
                  }
                },
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 12,
                  ),
                  primary: false,
                  itemCount: state.bestSellersModel.data?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 14),
                      child: ProductCard(
                        isWishlisted:
                            state.bestSellersModel.data?[index].isWishlisted,
                        onLike: () {
                          BlocProvider.of<BestsellersCubit>(context)
                              .addProductToWishlist(
                            state.bestSellersModel.data![index].id!,
                          );
                        },
                        onDislike: () {
                          BlocProvider.of<BestsellersCubit>(context)
                              .removeProductFromWishlist(
                            state.bestSellersModel.data![index].id!,
                          );
                        },
                        onAddToCart: () async {
                          context.read<AddToCartCubit>().addToCart(
                              state.bestSellersModel.data?[index].id ?? 2);
                        },
                        productName:
                            state.bestSellersModel.data?[index].name ?? '',
                        productId: state.bestSellersModel.data?[index].id,
                        isAddedToCart:
                            state.bestSellersModel.data?[index].isAddedToCart,
                        cartQuantity:
                            state.bestSellersModel.data?[index].cartQuantity,
                        productImage: state
                                .bestSellersModel.data?[index].thumbnailImage ??
                            '',
                        basePrice:
                            state.bestSellersModel.data?[index].basePrice,
                        baseDiscountedPrice: state
                            .bestSellersModel.data?[index].baseDiscountedPrice,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
