part of 'home.dart';

class _Combos extends StatefulWidget {
  const _Combos({
    Key? key,
  }) : super(key: key);

  @override
  State<_Combos> createState() => _CombosState();
}

class _CombosState extends State<_Combos> {
  @override
  void initState() {
    super.initState();
    context.read<CombosCubit>().getCombos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: BlocBuilder<CombosCubit, CombosState>(
        builder: (BuildContext context, CombosState state) {
          if (state is CombosInitial) {
            return const LoadingIndicator();
          } else if (state is CombosLoaded) {
            return ProductListBlock(
              title: 'Combos',
              onTap: () {},
              list: BlocProvider<AddToCartCubit>(
                create: (BuildContext context) => AddToCartCubit(),
                child: BlocListener<AddToCartCubit, AddToCartState>(
                  listener: (BuildContext context, AddToCartState state) {
                    if (state is AddToCartLoaded) {
                      context.read<CombosCubit>().getCombos();
                    } else if (state is AddToCartFailure) {
                      showSnackBar(
                          context: context, msg: state.failure.message);
                    }
                  },
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                    primary: false,
                    itemCount: state.combosModel.data?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 14),
                        child: ProductCard(
                          isWishlisted:
                              state.combosModel.data?[index].isWishlisted,
                          onLike: () {
                            BlocProvider.of<CombosCubit>(context)
                                .addProductToWishlist(
                              state.combosModel.data![index].id!,
                            );
                          },
                          onDislike: () {
                            BlocProvider.of<CombosCubit>(context)
                                .removeProductFromWishlist(
                              state.combosModel.data![index].id!,
                            );
                          },
                          onAddToCart: () async {
                            context.read<AddToCartCubit>().addToCart(
                                state.combosModel.data?[index].id ?? 2);
                          },
                          productName:
                              state.combosModel.data?[index].name ?? '',
                          productImage:
                              state.combosModel.data?[index].thumbnailImage ??
                                  '',
                          basePrice: state.combosModel.data?[index].basePrice,
                          isAddedToCart:
                              state.combosModel.data?[index].isAddedToCart,
                          cartQuantity:
                              state.combosModel.data?[index].cartQuantity,
                          baseDiscountedPrice: state
                              .combosModel.data?[index].baseDiscountedPrice,
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
      ),
    );
  }
}
