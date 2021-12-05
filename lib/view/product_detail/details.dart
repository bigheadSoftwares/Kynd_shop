part of 'product_detail.dart';

class _ProductDetail extends StatelessWidget {
  const _ProductDetail({
    Key? key,
  }) : super(key: key);

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
            Transform.scale(
              scale: 0.6,
              alignment: Alignment.centerLeft,
              child: const Points(points: 20),
            ),
            sizedBoxHeight(5),

            const CustomTitle(title: 'Kingfisher Premium Beer - 300 ml'),
            sizedBoxHeight(5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const SubHeading2(
                  '\$345/-',
                  color: Colour.greenishBlue,
                  fontWeight: FontWeight.w600,
                  size: 16,
                ),
                sizedBoxWidth(10),
                const CutMrp(
                  mrp: 345,
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
            const SubHeading2(
              'Eiusmod et culpa laborum mollit Lorem commodo tempor magna non occaecat cillum dolore reprehenderit. Anim quis deserunt duis ipsum sint eiusmod ipsum pariatur eu laborum excepteur aliqua. Reprehenderit eu minim amet voluptate aliquip eu do elit dolore cupidatat nulla. Nostrud nulla duis excepteur cillum ut est qui laborum consectetur exercitation labore proident est et.',
              color: Colour.lightGrey,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
