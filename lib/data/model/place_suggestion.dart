import 'package:equatable/equatable.dart';

class PlaceSuggestion extends Equatable {
  final String placeId;
  final String description;

  const PlaceSuggestion({
    required this.placeId,
    required this.description,
  });

  @override
  List<Object?> get props => [placeId, description];

  factory PlaceSuggestion.fromJson(Map<String, dynamic> json) {
    return PlaceSuggestion(
      placeId: json['place_id'] as String,
      description: json['description'] as String,
    );
  }
}
