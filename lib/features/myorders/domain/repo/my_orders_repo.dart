import '../../../homescreen/domain/entities/order_response_entity.dart';

abstract class MyOrdersRepo {
  Future<OrdersResponseEntity> getAllOrders();
}