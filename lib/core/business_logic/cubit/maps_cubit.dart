import 'package:bloc/bloc.dart';
import '../../../data/model/place.dart';
import 'package:equatable/equatable.dart';
import 'package:googlemaps/data/repo/maps_repo_imp.dart';
import 'package:googlemaps/data/model/place_directions.dart';
import 'package:googlemaps/data/model/place_suggestion.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepoImp mapsRepoImp;

  void emitPlaceSuggestion(String query, String sessionToken) async {
    emit(PlaceSuggestionLoading());
    try {
      final suggestions =
          await mapsRepoImp.fetchSuggestions(query, sessionToken);
      emit(PlaceSuggestionLoaded(suggestions));
    } catch (error) {
      emit(PlaceSuggestionError(error.toString()));
    }
  }

  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepoImp.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlaceLocationLoaded(place));
    });
  }

  void emitPlaceDirections(LatLng origin, LatLng destination) {
    mapsRepoImp.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }

  MapsCubit(this.mapsRepoImp)
      : super(
          MapsInitial(),
        );
}
