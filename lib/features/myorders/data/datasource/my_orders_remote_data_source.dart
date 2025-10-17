import 'package:tarcking_app/features/homescreen/data/models/orders_list_response.dart';

abstract class MyOrdersRemoteDataSource {
  Future<OrdersListResponse> getAllOrders();
}