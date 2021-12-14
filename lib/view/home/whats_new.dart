part of 'home.dart';

class _WhatsNew extends StatelessWidget {
  const _WhatsNew({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colour.offWhite,
      child: BlocBuilder<NewProductsCubit, NewProductsState>(
        bloc: context.read<NewProductsCubit>()..getNewProducts(),
        builder: (BuildContext context, NewProductsState state) {
          if (state is NewProductsInitial) {
            return const LoadingIndicator();
          }
          if (state is NewProductsLoaded) {
            return ProductListBlock(
              title: "What's New",
              onTap: () {},
              list: BlocProvider<AddToCartCubit>(
                create: (BuildContext context) => AddToCartCubit(),
                child: BlocListener<AddToCartCubit, AddToCartState>(
                  listener: (BuildContext context, AddToCartState state) {
                    if (state is AddToCartLoaded) {
                      context.read<NewProductsCubit>().getNewProducts();
                    } else if (state is AddToCartFailure) {
                      showSnackBar(
                          context: context, msg: state.failure.message);
                    }
                  },
                  child: ListView.builder(
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
                          onAddToCart: () async {
                            context.read<AddToCartCubit>().addToCart(
                                state.newProductsModel.data?[index].id ?? 2);
                          },
                          productName:
                              state.newProductsModel.data?[index].name ?? '',
                          productId: state.newProductsModel.data?[index].id,
                          isAddedToCart:
                              state.newProductsModel.data?[index].isAddedToCart,
                          cartQuantity:
                              state.newProductsModel.data?[index].cartQuantity,
                          productImage: state.newProductsModel.data?[index]
                                  .thumbnailImage ??
                              '',
                          basePrice:
                              state.newProductsModel.data?[index].basePrice,
                          baseDiscountedPrice: state.newProductsModel
                              .data?[index].baseDiscountedPrice,
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
