import '../../../categories/domain/model/product.dart';

class Item {
  final int? id;
  final int? productId;
  final int? orderId;
  final int? qty;
  final double? totalePrice;
  final String? createdAt;
  final String? updatedAt;
  final Product? product;

  Item({
    this.id,
    this.productId,
    this.orderId,
    this.qty,
    this.totalePrice,
    this.createdAt,
    this.updatedAt,
    this.product,
  });
}
