import '../../../homescreen/domain/entities/order_entity.dart';

class OrderDetails {
  final String id;
  final DateTime createdAt;
  final String state;
  final String orderNumber;
  final Address pickupAddress;
  final Address userAddress;
  final List<OrderItem> items;
  final double total;
  final String paymentMethod;
  final bool arrivedAtPickup;

  const OrderDetails({
    required this.id,
    required this.createdAt,
    required this.state,
    required this.orderNumber,
    required this.pickupAddress,
    required this.userAddress,
    required this.items,
    required this.total,
    required this.paymentMethod,
    required this.arrivedAtPickup,
  });

  factory OrderDetails.fromOrderEntity(OrderEntity orderEntity) {
    return OrderDetails(
      id: orderEntity.id,
      createdAt: orderEntity.createdAt,
      state: orderEntity.state,
      orderNumber: orderEntity.orderNumber,
      pickupAddress: Address(
        name: orderEntity.store.name,
        address: orderEntity.store.address,
        phoneNumber: orderEntity.store.phoneNumber,
      ),
      userAddress: Address(
        name: "${orderEntity.user.firstName} ${orderEntity.user.lastName}",
        address: "Heliopolis, Cairo",
        phoneNumber: orderEntity.user.phone,
      ),
      items:
          orderEntity.orderItems.map((item) {
            final productName = item.product.title;
            return OrderItem(
              name: productName,
              quantity: item.quantity,
              price: item.price.toDouble(),
              productId: item.product.id,
            );
          }).toList(),
      total: orderEntity.totalPrice.toDouble(),
      paymentMethod:
          orderEntity.paymentType == "cash"
              ? "Cash on delivery"
              : orderEntity.paymentType,
      arrivedAtPickup: false,
    );
  }

  OrderDetails copyWith({
    String? id,
    DateTime? createdAt,
    String? state,
    String? orderNumber,
    Address? pickupAddress,
    Address? userAddress,
    List<OrderItem>? items,
    double? total,
    String? paymentMethod,
    bool? arrivedAtPickup,
  }) {
    return OrderDetails(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      state: state ?? this.state,
      orderNumber: orderNumber ?? this.orderNumber,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      userAddress: userAddress ?? this.userAddress,
      items: items ?? this.items,
      total: total ?? this.total,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      arrivedAtPickup: arrivedAtPickup ?? this.arrivedAtPickup,
    );
  }
}

class Address {
  final String name;
  final String address;
  final String phoneNumber;

  const Address({
    required this.name,
    required this.address,
    required this.phoneNumber,
  });
}

class OrderItem {
  final String name;
  final int quantity;
  final double price;
  final String productId;

  const OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.productId,
  });
}
