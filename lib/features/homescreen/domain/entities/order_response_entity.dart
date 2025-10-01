import 'meta_data_entity.dart';
import 'order_entity.dart';

class OrdersResponseEntity {
  final String message;
  final Metadata metadata;
  final List<OrderEntity> orders;

  OrdersResponseEntity({
    required this.message,
    required this.metadata,
    required this.orders,
  });

  OrdersResponseEntity copyWith({
    String? message,
    Metadata? metadata,
    List<OrderEntity>? orders,
  }) {
    return OrdersResponseEntity(
      message: message ?? this.message,
      metadata: metadata ?? this.metadata,
      orders: orders ?? this.orders,
    );
  }
}
