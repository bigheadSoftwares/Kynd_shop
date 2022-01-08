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
            return Container();
          } else if (state is CombosLoaded) {
            return ProductListBlock(
              title: 'Combos',
              onTap: () {
                push(
                  context,
                  ViewAllGrid(
                    title: 'Combos',
                    viewAllChild: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemCount: state.combosModel.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return _CombosProductCard(
                          index: index,
                        );
                      },
                    ),
                  ),
                );
              },
              list: ListView.builder(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                primary: false,
                itemCount: state.combosModel.data?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 14),
                    child: _CombosProductCard(
                      index: index,
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

class _CombosProductCard extends StatefulWidget {
  const _CombosProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<_CombosProductCard> createState() => _CombosProductCardState();
}

class _CombosProductCardState extends State<_CombosProductCard> {
  late CombosLoaded state;
  @override
  Widget build(BuildContext context) {
    state = context.watch<CombosCubit>().state as CombosLoaded;
    return ProductCard(
      productId: state.combosModel.data?[widget.index].id,
      isWishlisted: state.combosModel.data?[widget.index].isWishlisted,
      onLike: () {
        BlocProvider.of<CombosCubit>(context).addProductToWishlist(
          state.combosModel.data![widget.index].id!,
        );
      },
      onDislike: () {
        BlocProvider.of<CombosCubit>(context).removeProductFromWishlist(
          state.combosModel.data![widget.index].id!,
        );
      },
      onAddToCart: () async {
        BlocProvider.of<CombosCubit>(context).addProductToCart(
            state.combosModel.data![widget.index].id!,
            state.combosModel.data![widget.index].cartQuantity!);
      },
      onIncTap: () async {
        BlocProvider.of<CombosCubit>(context).addProductToCart(
            state.combosModel.data![widget.index].id!,
            state.combosModel.data![widget.index].cartQuantity!);
      },
      onDecTap: () async {
        BlocProvider.of<CombosCubit>(context).removeProductFromCart(
            state.combosModel.data![widget.index].id!,
            state.combosModel.data![widget.index].cartQuantity!);
      },
      productName: state.combosModel.data?[widget.index].name ?? '',
      productImage: state.combosModel.data?[widget.index].thumbnailImage ?? '',
      basePrice: state.combosModel.data?[widget.index].basePrice,
      isAddedToCart: state.combosModel.data?[widget.index].isAddedToCart,
      cartQuantity: state.combosModel.data?[widget.index].cartQuantity,
      baseDiscountedPrice:
          state.combosModel.data?[widget.index].baseDiscountedPrice,
    );
  }
}
