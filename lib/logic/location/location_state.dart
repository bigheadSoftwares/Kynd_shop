part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => <Object>[];
}

class LocationInitial extends LocationState {}

class LocationFetched extends LocationState {
  const LocationFetched(this.location);
  final Position? location;
}

class LocationError extends LocationState {
  const LocationError(this.error);
  final String error;

  @override
  List<Object> get props => <String>[error];
}
