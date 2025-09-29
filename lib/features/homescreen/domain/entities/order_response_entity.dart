import 'meta_data_entity.dart';
import 'order_entity.dart';

class OrdersResponseEntity {
  final String message;
  final Metadata metadata;
  final List<OrderEntity> orders;

  const OrdersResponseEntity({
    required this.message,
    required this.metadata,
    required this.orders,
  });
}
