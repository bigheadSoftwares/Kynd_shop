import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const LocationError('Location services are disabled.'));
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(const LocationError('Location permissions are denied'));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(const LocationError(
        'Location permissions are permanently denied, we cannot request permissions.',
      ));
      return;
    }
    Position _location = await Geolocator.getCurrentPosition();
    emit(LocationFetched(_location));
  }
}
