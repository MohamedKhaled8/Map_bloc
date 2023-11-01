import 'package:googlemaps/data/model/place.dart';
import 'package:googlemaps/data/model/place_directions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapsRepo {
  Future<List<dynamic>> fetchSuggestions(String place, String sessionToken);
  Future<Place> getPlaceLocation(String placeId, String sessionToken);
  Future<PlaceDirections> getDirections(LatLng origin, LatLng destination);
}
