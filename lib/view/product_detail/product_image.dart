part of 'product_detail.dart';

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
      width: screenWidth(context),
      height: screenHeight(context) * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const <Widget>[
          // CustomNetworkImageWidget(
          //   image: Assets.beer,
          //   fit: BoxFit.contain,
          // ),
          CustomImageWidget(
            image: Assets.beer,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
