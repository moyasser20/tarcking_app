import 'package:json_annotation/json_annotation.dart';

part 'store_response.g.dart';

@JsonSerializable()
class StoreResponse {
  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "image")
  final String? image;

  @JsonKey(name: "address")
  final String? address;

  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;

  @JsonKey(name: "latLong")
  final String? latLong;

  StoreResponse({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });

  factory StoreResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoreResponseToJson(this);
}
