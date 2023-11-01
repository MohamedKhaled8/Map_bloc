part of 'maps_cubit.dart';

abstract class MapsState extends Equatable {
  const MapsState();

  @override
  List<Object> get props => [];
}

final class MapsInitial extends MapsState {}

class PlaceSuggestionLoading extends MapsState {}

// ignore: must_be_immutable
class PlaceSuggestionLoaded extends MapsState {
  List<PlaceSuggestion> place;
  PlaceSuggestionLoaded(
    this.place,
  );
}

class PlaceSuggestionError extends MapsState {
  final String error;

  const PlaceSuggestionError(this.error);
}

class PlaceLocationLoaded extends MapsState {
  final Place place;

  const PlaceLocationLoaded(this.place);
}

class DirectionsLoaded extends MapsState {
  final PlaceDirections placeDirections;

  const DirectionsLoaded(this.placeDirections);
}
