part of 'my_address.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _yourLocation = TextEditingController();
  final TextEditingController _flat = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _saveAs = TextEditingController();

  @override
  void dispose() {
    _yourLocation.dispose();
    _flat.dispose();
    _name.dispose();
    _mobile.dispose();
    _saveAs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'Add Address',
      ),
      body: Column(
        children: <Widget>[
          Map(yourLocation: _yourLocation),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _AddAddressTextField(
                        controller: _yourLocation,
                        label: 'Your Location',
                      ),
                      sizedBoxHeight(10),
                      _AddAddressTextField(
                        controller: _flat,
                        label: 'Flat/ Building / Street',
                      ),
                      sizedBoxHeight(10),
                      _AddAddressTextField(
                        controller: _name,
                        label: 'Name',
                      ),
                      sizedBoxHeight(10),
                      _AddAddressTextField(
                        controller: _mobile,
                        label: 'Mobile',
                        textInputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  sizedBoxHeight(10),
                  const SubHeading1(
                    'Save as',
                    color: Colour.subtitleColor,
                    size: 16,
                  ),
                  _SaveAsWidget(controller: _saveAs)
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: CustomButton(
          radius: 25,
          backgroundColor: Colour.greenishBlue,
          padding: const EdgeInsets.symmetric(vertical: 12),
          onTap: () {
            pop(context);
          },
          child: const SubHeading2(
            'SAVE',
            color: Colour.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

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
              '${state.location.latitude}, ${state.location.longitude}';
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
                    duration: const Duration(seconds: 2),
                    height: value,
                    width: screenWidth(context),
                    color: Colour.lightBlue,
                    child: GoogleMap(
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          state.location.latitude,
                          state.location.longitude,
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
