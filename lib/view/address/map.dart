import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../logic/location/location_cubit.dart';
import '../../utils/export_utilities.dart';
import '../../utils/functions/get_address_using_coordinates.dart';
import 'package:provider/src/provider.dart';

class MapWidget extends StatefulWidget {
  MapWidget({
    Key? key,
    required this.yourLocation,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);
  final TextEditingController yourLocation;
  final TextEditingController latitude;
  final TextEditingController longitude;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
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
      listener: (BuildContext context, LocationState state) async {
        if (state is LocationFetched) {
          widget.yourLocation.text = await getAddressFromLatLng(
              state.location!.latitude, state.location!.longitude);
          widget.latitude.text = state.location?.latitude.toString() ?? '0.0';
          widget.longitude.text = state.location?.longitude.toString() ?? '0.0';
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
                      onCameraMove: (CameraPosition? cameraPosition) async {
                        _mapHeight.value = screenHeight(context) * 0.7;
                        if (cameraPosition != null) {
                          widget.yourLocation.text = await getAddressFromLatLng(
                              cameraPosition.target.latitude,
                              cameraPosition.target.longitude);
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
