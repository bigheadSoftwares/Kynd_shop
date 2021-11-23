part of 'home.dart';

class _ExploreCategory extends StatelessWidget {
  const _ExploreCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: _Title(
            title: 'Explore by Category',
          ),
        ),
        sizedBoxHeight(15),
        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 12, right: 12),
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: DrinkCategoryCard(
                  backgroundColor: Colour.lightGreen,
                  image: Assets.beer,
                  name: 'Beer',
                ),
              );
            },
          ),
        ),
        sizedBoxHeight(20),
      ],
    );
  }
}

class DrinkCategoryCard extends StatelessWidget {
  const DrinkCategoryCard({
    Key? key,
    required this.backgroundColor,
    required this.image,
    required this.name,
  }) : super(key: key);

  final Color backgroundColor;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: CustomImageWidget(
            image: image,
            fit: BoxFit.contain,
          ),
        ),
        sizedBoxHeight(8),
        SubHeading2(
          name,
          color: Colour.black,
          size: 12,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}

