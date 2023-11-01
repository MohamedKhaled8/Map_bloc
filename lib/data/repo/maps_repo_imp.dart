import 'package:googlemaps/data/model/place.dart';
import 'package:googlemaps/data/repo/maps_repo.dart';
import 'package:googlemaps/data/model/place_directions.dart';
import 'package:googlemaps/data/model/place_suggestion.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemaps/data/web_services/place_webservices.dart';

class MapsRepoImp extends MapsRepo {
  final PlaceWebServices placeWebServices;
  MapsRepoImp(
    this.placeWebServices,
  );

  @override
  Future<List<PlaceSuggestion>> fetchSuggestions(
      String place, String sessionToken) async {
    try {
      final suggestions =
          await placeWebServices.fetchSuggestions(place, sessionToken);
      return suggestions
          .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
          .toList();
    } catch (error) {
      throw Exception("Failed to load suggestions: $error");
    }
  }

  @override
  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    final place =
        await placeWebServices.getPlaceLocation(placeId, sessionToken);
    // var readyPlace = Place.fromJson(place);
    return Place.fromJson(place);
  }

  @override
  Future<PlaceDirections> getDirections(
      LatLng origin, LatLng destination) async {
    final directions =
        await placeWebServices.getDirections(origin, destination);

    return PlaceDirections.fromJson(directions);
  }
}
//placeLocation
       // .map((placeLocation) => Place.fromJson(placeLocation))
        //.toList();