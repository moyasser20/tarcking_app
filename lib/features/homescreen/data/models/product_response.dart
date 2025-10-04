import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "slug")
  final String? slug;

  @JsonKey(name: "description")
  final String? description;

  @JsonKey(name: "imgCover")
  final String? imgCover;

  @JsonKey(name: "images")
  final List<String>? images;

  @JsonKey(name: "price")
  final int? price;

  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;

  @JsonKey(name: "quantity")
  final int? quantity;

  @JsonKey(name: "sold")
  final int? sold;

  @JsonKey(name: "category")
  final String? category;

  @JsonKey(name: "occasion")
  final String? occasion;

  @JsonKey(name: "rateAvg")
  final double? rateAvg;

  @JsonKey(name: "rateCount")
  final int? rateCount;

  @JsonKey(name: "createdAt")
  final String? createdAt;

  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  ProductResponse({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.sold,
    this.category,
    this.occasion,
    this.rateAvg,
    this.rateCount,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
