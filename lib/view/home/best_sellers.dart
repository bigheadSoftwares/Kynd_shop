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
                  child: ProductCard(
                    productName: state.bestSellersModel.data?[index].name ?? '',
                    productImage:
                        state.bestSellersModel.data?[index].thumbnailImage ??
                            '',
                    basePrice: state.bestSellersModel.data?[index].basePrice,
                    baseDiscountedPrice:
                        state.bestSellersModel.data?[index].baseDiscountedPrice,
                  ),
                );
              },
            ),
          );
        } else {
          return ProductListBlock(
            title: 'Bestsellers',
            onTap: () {},
            list: ListView.builder(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 15,
              ),
              primary: false,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 14),
                  child: ProductCard(
                    productName: 'Kingfisher Beer Premium - 300 ml',
                    productImage: '',
                    basePrice: 400,
                    baseDiscountedPrice: 300,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
