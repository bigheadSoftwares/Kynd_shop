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
            onTap: () {
              push(
                context,
                ViewAllGrid(
                  title: 'Bestsellers',
                  viewAllChild: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.62,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: state.bestSellersModel.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return _ProductCardWidget(
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
              itemCount: state.bestSellersModel.data?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 14),
                  child: _ProductCardWidget(
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
    );
  }
}

class _ProductCardWidget extends StatefulWidget {
  const _ProductCardWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<_ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<_ProductCardWidget> {
  late BestsellersLoaded state;
  @override
  Widget build(BuildContext context) {
    state = context.watch<BestsellersCubit>().state as BestsellersLoaded;
    return ProductCard(
      isWishlisted: state.bestSellersModel.data?[widget.index].isWishlisted,
      onLike: () {
        BlocProvider.of<BestsellersCubit>(context).addProductToWishlist(
          state.bestSellersModel.data![widget.index].id!,
        );
      },
      onDislike: () {
        BlocProvider.of<BestsellersCubit>(context).removeProductFromWishlist(
          state.bestSellersModel.data![widget.index].id!,
        );
      },
      onAddToCart: () async {
        BlocProvider.of<BestsellersCubit>(context).addProductToCart(
            state.bestSellersModel.data![widget.index].id!,
            state.bestSellersModel.data![widget.index].cartQuantity!);
      },
      onIncTap: () async {
        BlocProvider.of<BestsellersCubit>(context).addProductToCart(
            state.bestSellersModel.data![widget.index].id!,
            state.bestSellersModel.data![widget.index].cartQuantity!);
      },
      onDecTap: () async {
        BlocProvider.of<BestsellersCubit>(context).removeProductFromCart(
            state.bestSellersModel.data![widget.index].id!,
            state.bestSellersModel.data![widget.index].cartQuantity!);
      },
      productName: state.bestSellersModel.data?[widget.index].name ?? '',
      productId: state.bestSellersModel.data?[widget.index].id,
      isAddedToCart: state.bestSellersModel.data?[widget.index].isAddedToCart,
      cartQuantity: state.bestSellersModel.data?[widget.index].cartQuantity,
      productImage:
          state.bestSellersModel.data?[widget.index].thumbnailImage ?? '',
      basePrice: state.bestSellersModel.data?[widget.index].basePrice,
      baseDiscountedPrice:
          state.bestSellersModel.data?[widget.index].baseDiscountedPrice,
    );
  }
}
