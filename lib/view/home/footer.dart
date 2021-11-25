part of 'home.dart';


class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Colour.offWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const _Title(title: 'THE KIND\nSHOP'),
                Heading1(
                  '© KYND',
                  color: Colour.lightGrey.withOpacity(0.6),
                  size: 18,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const CustomImageWidget(
            image: Assets.footer,
            scale: 1.5,
          )
        ],
      ),
    );
  }
}
