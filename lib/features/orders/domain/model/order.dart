import 'item.dart';

class Order {
  final int? id;
  final String? orderNumber;
  final int? status;
  final String? currency;
  final double? totalPrice;
  final String? formattedDate;
  final List<Item>? items;

  Order({
    this.id,
    this.orderNumber,
    this.status,
    this.currency,
    this.totalPrice,
    this.formattedDate,
    this.items,
  });
}
