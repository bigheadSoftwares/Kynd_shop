part of 'home.dart';

class _BestSellers extends StatelessWidget {
  const _BestSellers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestsellersCubit, BestsellersState>(
      bloc: context.read<BestsellersCubit>()..getBestSellers(),
      builder: (BuildContext context, BestsellersState state) {
        if (state is BestsellersInitial) {
          return const LoadingIndicator();
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
