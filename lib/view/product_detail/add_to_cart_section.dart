part of 'product_detail.dart';

class _BottomCartSection extends StatelessWidget {
  const _BottomCartSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colour.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                IncrementDecrementButton(
                  number: 2,
                ),
                SubHeading2(
                  '\$234/-',
                  color: Colour.greenishBlue,
                  fontWeight: FontWeight.w500,
                  size: 18,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: RoundContainer(
              onTap: () {
                pushNamed(context, Routes.cart);
              },
              hPadding: 10,
              vPadding: 10,
              radius: 30,
              color: Colour.greenishBlue,
              width: double.infinity,
              child: const Center(
                child: SubHeading1(
                  'Add to Cart',
                  color: Colour.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
