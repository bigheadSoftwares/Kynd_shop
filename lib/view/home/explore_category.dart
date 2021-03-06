part of 'home.dart';

class _ExploreCategory extends StatefulWidget {
  const _ExploreCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<_ExploreCategory> createState() => _ExploreCategoryState();
}

class _ExploreCategoryState extends State<_ExploreCategory> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getDrinkCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CustomTitle(
            title: 'Explore by Category',
          ),
        ),
        sizedBoxHeight(15),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (BuildContext context, CategoryState state) {
            if (state is CategoryInitial) {
              return const ShimmerBox();
            } else if (state is CategoryLoaded) {
              return SizedBox(
                height: 115,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  itemCount: state.categoryModel.data?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          pushNamed(context, Routes.category,
                              arguments: <dynamic>[
                                state.categoryModel.data?[index].id ?? 0,
                                state.categoryModel.data?[index].name ?? ''
                              ]);
                        },
                        child: DrinkCategoryCard(
                          backgroundColor: Colour.lightGreen,
                          image: state.categoryModel.data?[index].icon ?? '',
                          name: state.categoryModel.data?[index].name ?? '',
                        ),
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
          // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: CustomNetworkImageWidget(
            image: image,
            fit: BoxFit.cover,
            scale: 0.3,
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
