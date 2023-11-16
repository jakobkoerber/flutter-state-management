import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lon")
  final double lon;
  @JsonKey(name: "country")
  final String country;
  @JsonKey(name: "state")
  final String? state;

  SearchResponse({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class SearchResponses {
  final List<SearchResponse>? searchResponses;

  SearchResponses({this.searchResponses});

  factory SearchResponses.fromJson(Map<String, dynamic> json) =>
      _$SearchResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponsesToJson(this);
}
