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
              children: [
                Row(
                  children: <Widget>[
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        color: Colour.greenishBlue,
                        size: 18,
                      ),
                    ),
                    const RoundContainer(
                      borderColor: Colour.greenishBlue,
                      borderWidth: 1,
                      radius: 4,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
                        child: SubHeading2(
                          '2',
                          color: Colour.greenishBlue,
                          size: 12,
                        ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colour.greenishBlue,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SubHeading2(
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
              onTap: () {},
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
