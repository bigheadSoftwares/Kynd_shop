part of 'home.dart';

class _Combos extends StatelessWidget {
  const _Combos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: BlocBuilder<CombosCubit, CombosState>(
        bloc: context.read<CombosCubit>()..getCombos(),
        builder: (BuildContext context, CombosState state) {
          if (state is CombosInitial) {
            return const LoadingIndicator();
          } else if (state is CombosLoaded) {
            return ProductListBlock(
              title: 'Combos',
              onTap: () {},
              list: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 12,
                ),
                primary: false,
                itemCount: state.combosModel.data?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 14),
                    child: ProductCard(
                      productName: state.combosModel.data?[index].name ?? '',
                      productImage:
                          state.combosModel.data?[index].thumbnailImage ?? '',
                      basePrice: state.combosModel.data?[index].basePrice,
                      baseDiscountedPrice:
                          state.combosModel.data?[index].baseDiscountedPrice,
                    ),
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
