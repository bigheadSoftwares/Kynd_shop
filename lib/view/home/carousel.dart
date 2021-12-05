part of 'home.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersCubit, BannersState>(
      bloc: context.read<BannersCubit>()..getBanners(),
      builder: (BuildContext context, BannersState state) {
        if (state is BannersInitial) {
          return const LoadingIndicator();
        } else if (state is BannersLoaded) {
          return Column(
            children: <Widget>[
              Expanded(
                child: CarouselSlider(
                  items: state.list,
                  carouselController: _controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 0.8,
                    aspectRatio: 3.0,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.list
                    .asMap()
                    .entries
                    .map((MapEntry<int, Widget> entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colour.greenishBlue
                              .withOpacity(_current == entry.key ? 1 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
