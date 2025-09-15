import '../../../categories/domain/model/product.dart';

class Cart {
  final int? id;
  final int? productId;
  final String? cartKey;
  int? qty;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  final Product? product;

  Cart({
    this.id,
    this.productId,
    this.cartKey,
    this.qty,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  Cart copyWith({
    int? id,
    int? productId,
    String? cartKey,
    int? qty,
    int? userId,
    String? createdAt,
    String? updatedAt,
    Product? product,
  }) {
    return Cart(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      cartKey: cartKey ?? this.cartKey,
      qty: qty ?? this.qty,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      product: product ?? this.product,
    );
  }
}
