part of 'home.dart';

class _PopularBrands extends StatelessWidget {
  const _PopularBrands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (BuildContext context, BrandsState state) {
        if (state is BrandsLoading) {
          return const LoadingIndicator();
        } else if (state is BrandsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomTitle(title: 'Popular Brands'),
              ),
              sizedBoxHeight(15),
              SizedBox(
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
                        backgroundImage: AssetImage(Assets.turborg),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
