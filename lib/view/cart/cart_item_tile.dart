part of 'cart.dart';

class _CartItemTile extends StatelessWidget {
  const _CartItemTile({
    Key? key,
    required this.item,
    required this.onaddInc,
    required this.onaddDec,
    required this.onRemoveItem,
  }) : super(key: key);
  final Datum item;
  final VoidCallback onaddInc;
  final VoidCallback onaddDec;
  final VoidCallback onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leading: RoundContainer(
        hPadding: 30,
        vPadding: 10,
        radius: 8,
        borderColor: Colour.lightGrey.withOpacity(0.2),
        child: const CustomImageWidget(
          image: Assets.beer,
          height: 80,
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: SubHeading2(
            item.product!.name!,
            fontWeight: FontWeight.bold,
          )),
          InkWell(
            onTap: onRemoveItem,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Icon(
                Icons.close,
                size: 20,
                color: Colour.lightGrey.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Transform.scale(
          //   scale: 0.5,
          //   alignment: Alignment.centerLeft,
          //   child: const Points(points: 12),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SubHeading2(
                '${Constants.rupee} ${item.price}/-',
                size: 14,
                fontWeight: FontWeight.bold,
                color: Colour.greenishBlue,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colour.lightGrey.withOpacity(0.5),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: onaddDec,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
                        child: Icon(
                          Icons.remove,
                          color: Colour.lightGrey,
                          size: 15,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: Colour.lightGrey.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0),
                        child: SubHeading2(
                          '${item.quantity}',
                          color: Colour.black,
                          size: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onaddInc,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
                        child: Icon(
                          Icons.add,
                          color: Colour.lightGrey,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
