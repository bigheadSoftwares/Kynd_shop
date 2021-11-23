part of 'home.dart';

class _ProductListBlock extends StatelessWidget {
  const _ProductListBlock({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _Title(title: title),
              InkWell(
                onTap: onTap,
                child: const SubHeading2(
                  'View All',
                  color: Colour.greenishBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        sizedBoxHeight(15),
        SizedBox(
          height: 340,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            primary: false,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 10, left: 14),
                child: ProductCard(),
              );
            },
          ),
        ),
      ],
    );
  }
}
