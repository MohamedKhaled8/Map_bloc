import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double lat;
  final double lng;

  const Location({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [lat, lng];

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'] as double,
      lng: json['lng'] as double,
    );
  }
}

class Geometry extends Equatable {
  final Location location;

  Geometry({
    required this.location,
  });

  @override
  List<Object?> get props => [location];

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: Location.fromJson(json['location']),
    );
  }
}

class Result extends Equatable {
  final Geometry geometry;

  Result({
    required this.geometry,
  });

  @override
  List<Object?> get props => [geometry];

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      geometry: Geometry.fromJson(json['geometry']),
    );
  }
}

class Place extends Equatable {
  final Result result;

  Place({
    required this.result,
  });

  @override
  List<Object?> get props => [result];

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      result: Result.fromJson(json['result']),
    );
  }
}
