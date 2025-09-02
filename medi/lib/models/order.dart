import 'medicine.dart';

class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double totalPrice;
  final String status;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'] ?? '',
      userId: json['user'] ?? '',
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      status: json['status'] ?? 'Ordered',
    );
  }
}

class OrderItem {
  final Medicine medicine;
  final int quantity;

  OrderItem({required this.medicine, required this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      medicine: Medicine.fromJson(json['medicine']),
      quantity: json['quantity'] ?? 0,
    );
  }
}
