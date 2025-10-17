import 'package:json_annotation/json_annotation.dart';
import '../../../homescreen/data/models/store_response.dart';
import 'order_response.dart';


part 'order_wrapper_response.g.dart';

@JsonSerializable()
class OrderWrapperResponse {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "driver")
  final String? driver;

  @JsonKey(name: "order")
  final OrderResponse? order;

  @JsonKey(name: "store")
  final StoreResponse? store;

  OrderWrapperResponse({this.id, this.driver, this.order, this.store});

  factory OrderWrapperResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderWrapperResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderWrapperResponseToJson(this);
}