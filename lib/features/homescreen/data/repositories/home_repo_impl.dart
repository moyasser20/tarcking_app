import 'package:injectable/injectable.dart';

import '../../domain/entities/meta_data_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_item_entity.dart';
import '../../domain/entities/order_response_entity.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_remote_datasource.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);

  @override
  Future<OrdersResponseEntity> getOrders() async {
    final dto = await remoteDataSource.getOrders();

    final orders =
        (dto.orders ?? []).map((orderWrapper) {
          final orderDto = orderWrapper.order;
          final storeDto = orderWrapper.store;

          final orderItems = <OrderItemEntity>[];

          return OrderEntity(
            id: orderDto?.id ?? "",
            user: UserEntity(
              id: orderDto?.user?.id ?? "",
              firstName: orderDto?.user?.firstName ?? "",
              lastName: orderDto?.user?.lastName ?? "",
              email: orderDto?.user?.email ?? "",
              gender: orderDto?.user?.gender ?? "",
              phone: orderDto?.user?.phone ?? "",
              photo: orderDto?.user?.photo ?? "",
            ),
            orderItems: orderItems,
            totalPrice: orderDto?.totalPrice ?? 0,
            paymentType: orderDto?.paymentType ?? "",
            isPaid: orderDto?.isPaid ?? false,
            isDelivered: orderDto?.isDelivered ?? false,
            state: orderDto?.state ?? "",
            orderNumber: orderDto?.orderNumber ?? "",
            store: StoreEntity(
              name: storeDto?.name ?? "",
              image: storeDto?.image ?? "",
              address: storeDto?.address ?? "",
              phoneNumber: storeDto?.phoneNumber ?? "",
              latLong: storeDto?.latLong ?? "",
            ),
            createdAt: _safeParseDate(orderDto?.createdAt),
            updatedAt: _safeParseDate(orderDto?.updatedAt),
          );
        }).toList();

    final metadata = Metadata(
      currentPage: dto.metadata?['currentPage'] ?? 1,
      totalPages: dto.metadata?['totalPages'] ?? 1,
      totalItems: dto.metadata?['totalItems'] ?? 0,
      limit: dto.metadata?['limit'] ?? 10,
    );

    return OrdersResponseEntity(
      message: dto.message ?? "",
      metadata: metadata,
      orders: orders,
    );
  }

  DateTime _safeParseDate(String? date) {
    if (date == null) return DateTime.now();
    try {
      return DateTime.parse(date);
    } catch (_) {
      return DateTime.now();
    }
  }
}
