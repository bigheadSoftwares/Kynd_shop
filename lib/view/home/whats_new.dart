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
          // if (state is NewProductsInitial) {
          //   return const LoadingIndicator();
          // }
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
                      productName:
                          state.newProductsModel.data?[index].name ?? '',
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
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 14),
                    child: ProductCard(
                      productName: 'Blue and White Whiskey',
                      productImage: '',
                      basePrice: 1100,
                      baseDiscountedPrice: 800,
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
