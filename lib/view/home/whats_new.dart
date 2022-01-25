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
              onTap: () {
                push(
                  context,
                  ViewAllGrid(
                    title: "What's New",
                    viewAllChild: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.5,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemCount: state.newProductsModel.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return _WhatsNewProductCard(
                          index: index,
                        );
                      },
                    ),
                  ),
                );
              },
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
                    child: _WhatsNewProductCard(
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

class _WhatsNewProductCard extends StatefulWidget {
  const _WhatsNewProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<_WhatsNewProductCard> createState() => _WhatsNewProductCardState();
}

class _WhatsNewProductCardState extends State<_WhatsNewProductCard> {
  late NewProductsLoaded state;
  @override
  Widget build(BuildContext context) {
    state = context.watch<NewProductsCubit>().state as NewProductsLoaded;
    return ProductCard(
      isWishlisted: state.newProductsModel.data?[widget.index].isWishlisted,
      onLike: () {
        BlocProvider.of<NewProductsCubit>(context).addProductToWishlist(
          state.newProductsModel.data![widget.index].id!,
        );
      },
      onDislike: () {
        BlocProvider.of<NewProductsCubit>(context).removeProductFromWishlist(
          state.newProductsModel.data![widget.index].id!,
        );
      },
      onAddToCart: () async {
        BlocProvider.of<NewProductsCubit>(context).addProductToCart(
            state.newProductsModel.data![widget.index].id!,
            state.newProductsModel.data![widget.index].cartQuantity!);
      },
      onIncTap: () async {
        BlocProvider.of<NewProductsCubit>(context).addProductToCart(
            state.newProductsModel.data![widget.index].id!,
            state.newProductsModel.data![widget.index].cartQuantity!);
      },
      onDecTap: () async {
        BlocProvider.of<NewProductsCubit>(context).removeProductFromCart(
            state.newProductsModel.data![widget.index].id!,
            state.newProductsModel.data![widget.index].cartQuantity!);
      },
      productName: state.newProductsModel.data?[widget.index].name ?? '',
      productId: state.newProductsModel.data?[widget.index].id,
      isAddedToCart: state.newProductsModel.data?[widget.index].isAddedToCart,
      cartQuantity: state.newProductsModel.data?[widget.index].cartQuantity,
      productImage:
          state.newProductsModel.data?[widget.index].thumbnailImage ?? '',
      basePrice: state.newProductsModel.data?[widget.index].basePrice,
      baseDiscountedPrice:
          state.newProductsModel.data?[widget.index].baseDiscountedPrice,
    );
  }
}
