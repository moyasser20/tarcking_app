import 'package:tarcking_app/features/homescreen/domain/entities/order_item_entity.dart';
import 'package:tarcking_app/features/homescreen/domain/entities/store_entity.dart';
import 'package:tarcking_app/features/homescreen/domain/entities/user_entity.dart';

class OrderEntity {
  final String id;
  final UserEntity user;
  final List<OrderItemEntity> orderItems;
  final int totalPrice;
  final String paymentType;
  final bool isPaid;
  final bool isDelivered;
  final String state;
  final String orderNumber;
  final StoreEntity store;

  final DateTime createdAt;
  final DateTime updatedAt;

  const OrderEntity({
    required this.id,
    required this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.paymentType,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
    required this.orderNumber,
    required this.store,
    required this.createdAt,
    required this.updatedAt,
  });
}
