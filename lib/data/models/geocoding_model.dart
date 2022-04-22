import 'package:json_annotation/json_annotation.dart';
part 'geocoding_model.g.dart';

@JsonSerializable()
class GeocodingModel {
  String? name;
  @JsonKey(name: 'local_names')
  Map<String, dynamic>? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  GeocodingModel({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  factory GeocodingModel.fromJson(Map<String, dynamic> json) =>
      _$GeocodingModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodingModelToJson(this);
}
