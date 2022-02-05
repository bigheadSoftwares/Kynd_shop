part of 'product_detail.dart';

class _ProductDetail extends StatelessWidget {
  const _ProductDetail({
    Key? key,
    required this.productName,
    required this.basePrice,
    required this.discountedPrice,
    required this.description,
  }) : super(key: key);
  final String productName;
  final num basePrice;
  final num discountedPrice;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight(context) * 0.38,
      child: Container(
        width: screenWidth(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colour.white),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Transform.scale(
            //   scale: 0.6,
            //   alignment: Alignment.centerLeft,
            //   child: const Points(points: 20),
            // ),
            sizedBoxHeight(5),

            CustomTitle(title: productName),
            sizedBoxHeight(5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SubHeading2(
                  '\$$discountedPrice/-',
                  color: Colour.greenishBlue,
                  fontWeight: FontWeight.w600,
                  size: 16,
                ),
                sizedBoxWidth(10),
                CutMrp(
                  mrp: basePrice,
                  size: 12,
                ),
              ],
            ),
            // CustomPaint(painter: LineDashedPainter())
            sizedBoxHeight(20),
            const SubHeading2(
              'Description',
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            sizedBoxHeight(10),
            SubHeading2(
              description,
              color: Colour.lightGrey,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
