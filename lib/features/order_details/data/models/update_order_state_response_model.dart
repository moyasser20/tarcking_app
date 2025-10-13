import '../../../homescreen/data/models/order_response.dart';

class UpdateOrderStateResponse {
  final String message;
  final OrderResponse order;

  UpdateOrderStateResponse({required this.message, required this.order});

  factory UpdateOrderStateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateOrderStateResponse(
      message: json['message'] ?? '',
      order: OrderResponse.fromJson(json['orders']),
    );
  }
}
