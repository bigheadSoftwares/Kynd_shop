part of 'home.dart';

class _PopularBrands extends StatefulWidget {
  const _PopularBrands({
    Key? key,
  }) : super(key: key);

  @override
  State<_PopularBrands> createState() => _PopularBrandsState();
}

class _PopularBrandsState extends State<_PopularBrands> {
  @override
  void initState() {
    super.initState();
    context.read<BrandsCubit>().fetchBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomTitle(title: 'Popular Brands'),
        ),
        sizedBoxHeight(15),
        BlocBuilder<BrandsCubit, BrandsState>(
          builder: (BuildContext context, BrandsState state) {
            if (state is BrandsSuccess) {
              return SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  itemCount: state.brandsModel.data.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _ImageWidget(
                      brand: state.brandsModel.data[index],
                    );
                  },
                ),
              );
            } else if (state is BrandsLoading || state is BrandsInitial) {
              return const _PopularBrandsLoadingWidget();
            } else if (state is BrandsError) {
              return SubHeading2(state.error.message);
            } else {
              return const SubHeading2('Unhandled state');
            }
          },
        )
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    Key? key,
    required this.brand,
  }) : super(key: key);

  final Brands brand;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(Assets.turborg),
      ),
      // child: CachedNetworkImage(
      //   imageUrl: brand.logo,
      //   imageBuilder: (BuildContext context, ImageProvider imageProvider) {
      //     return CircleAvatar(
      //       radius: 50,
      //       backgroundImage: imageProvider,
      //     );
      //   },
      //   errorWidget: (BuildContext context, String url, dynamic error) {
      //     debugPrint('$error');
      //     return const Icon(Icons.error);
      //   },
      // ),
    );
  }
}

class _PopularBrandsLoadingWidget extends StatelessWidget {
  const _PopularBrandsLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 50,
            ),
          ).shimmer();
        },
      ),
    );
  }
}
