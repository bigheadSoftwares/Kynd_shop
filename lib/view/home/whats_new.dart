part of 'home.dart';

class _WhatsNew extends StatefulWidget {
  const _WhatsNew({
    Key? key,
  }) : super(key: key);

  @override
  State<_WhatsNew> createState() => _WhatsNewState();
}

class _WhatsNewState extends State<_WhatsNew> {
  @override
  void initState() {
    super.initState();
    context.read<NewProductsCubit>().getNewProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colour.offWhite,
      child: BlocBuilder<NewProductsCubit, NewProductsState>(
        builder: (BuildContext context, NewProductsState state) {
          if (state is NewProductsInitial) {
            return const ShimmerBox(
              height: 140,
              width: 150,
              itemCount: 4,
            );
          }
          if (state is NewProductsLoaded) {
            return ProductListBlock(
              title: "What's New",
              onTap: () {},
              list: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 12,
                ),
                primary: false,
                itemCount: state.newProductsModel.data?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 14),
                    child: ProductCard(
                      isWishlisted:
                          state.newProductsModel.data?[index].isWishlisted,
                      onLike: () {
                        BlocProvider.of<NewProductsCubit>(context)
                            .addProductToWishlist(
                          state.newProductsModel.data![index].id!,
                        );
                      },
                      onDislike: () {
                        BlocProvider.of<NewProductsCubit>(context)
                            .removeProductFromWishlist(
                          state.newProductsModel.data![index].id!,
                        );
                      },
                      onAddToCart: () async {
                        BlocProvider.of<NewProductsCubit>(context)
                            .addProductToCart(
                                state.newProductsModel.data![index].id!,
                                state.newProductsModel.data![index]
                                    .cartQuantity!);
                      },
                      onIncTap: () async {
                        BlocProvider.of<NewProductsCubit>(context)
                            .addProductToCart(
                                state.newProductsModel.data![index].id!,
                                state.newProductsModel.data![index]
                                    .cartQuantity!);
                      },
                      onDecTap: () async {
                        BlocProvider.of<NewProductsCubit>(context)
                            .removeProductFromCart(
                                state.newProductsModel.data![index].id!,
                                state.newProductsModel.data![index]
                                    .cartQuantity!);
                      },
                      productName:
                          state.newProductsModel.data?[index].name ?? '',
                      productId: state.newProductsModel.data?[index].id,
                      isAddedToCart:
                          state.newProductsModel.data?[index].isAddedToCart,
                      cartQuantity:
                          state.newProductsModel.data?[index].cartQuantity,
                      productImage:
                          state.newProductsModel.data?[index].thumbnailImage ??
                              '',
                      basePrice: state.newProductsModel.data?[index].basePrice,
                      baseDiscountedPrice: state
                          .newProductsModel.data?[index].baseDiscountedPrice,
                    ),
                  );
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
