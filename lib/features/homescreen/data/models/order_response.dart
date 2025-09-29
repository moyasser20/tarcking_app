import 'package:json_annotation/json_annotation.dart';
import 'package:tarcking_app/features/homescreen/data/models/store_response.dart';
import 'package:tarcking_app/features/homescreen/data/models/user_response.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "totalPrice")
  final int totalPrice;
  @JsonKey(name: "state")
  final String state;
  @JsonKey(name: "paymentType")
  final String paymentType;
  @JsonKey(name: "orderNumber")
  final String orderNumber;
  @JsonKey(name: "orderItems")
  final List<dynamic> orderItems;
  @JsonKey(name: "isPaid")
  final bool isPaid;
  @JsonKey(name: "isDelivered")
  final bool isDelivered;
  @JsonKey(name: "createdAt")
  final String createdAt;
  @JsonKey(name: "updatedAt")
  final String updatedAt;

  @JsonKey(name: "store")
  final StoreResponse store;
  @JsonKey(name: "user")
  final UserResponse user;

  OrderResponse({
    required this.id,
    required this.totalPrice,
    required this.state,
    required this.paymentType,
    required this.orderNumber,
    required this.store,
    required this.user,
    required this.orderItems,
    required this.isPaid,
    required this.isDelivered,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
