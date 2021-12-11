part of 'home.dart';

class _Combos extends StatelessWidget {
  const _Combos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: BlocBuilder<CombosCubit, CombosState>(
        bloc: context.read<CombosCubit>()..getCombos(),
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
