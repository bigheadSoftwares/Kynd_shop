part of 'my_address.dart';

class Map extends StatefulWidget {
  const Map({
    Key? key,
    required this.yourLocation,
  }) : super(key: key);
  final TextEditingController yourLocation;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> _mapHeight =
        ValueNotifier<double>(screenHeight(context) * 0.25);
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (BuildContext context, LocationState state) {
        if (state is LocationFetched) {
          widget.yourLocation.text =
              '${state.location?.latitude}, ${state.location?.longitude}';
        }
      },
      builder: (BuildContext context, LocationState state) {
        if (state is LocationFetched) {
          return ValueListenableBuilder<double>(
            valueListenable: _mapHeight,
            builder: (BuildContext context, double value, Widget? child) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: value,
                    width: screenWidth(context),
                    color: Colour.lightBlue,
                    child: GoogleMap(
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          state.location?.latitude ?? Constants.initialLatitude,
                          state.location?.longitude ??
                              Constants.initialLongitude,
                        ),
                        zoom: 14.5,
                      ),
                      onCameraMove: (CameraPosition? cameraPosition) {
                        _mapHeight.value = screenHeight(context) * 0.7;
                        if (cameraPosition != null) {
                          widget.yourLocation.text =
                              '${cameraPosition.target.latitude}, ${cameraPosition.target.longitude}';
                        }
                      },
                      onCameraIdle: () {
                        _mapHeight.value = screenHeight(context) * 0.25;
                      },
                    ),
                  ),
                  const CustomImageWidget(
                    image: Assets.marker,
                    scale: 2,
                  )
                ],
              );
            },
          );
        } else if (state is LocationError) {
          return SubHeading2(state.error);
        } else {
          return Container(
            height: screenHeight(context) * 0.25,
            width: screenWidth(context),
            color: Colour.white,
          ).shimmer();
        }
      },
    );
  }
}
