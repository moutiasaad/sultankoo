import 'package:json_annotation/json_annotation.dart';

import '../../../../categories/data/remote/dto/product_dto.dart';
import '../../../domain/model/cart.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto {
  final int? id;
  final int? productId;
  final String? cartKey;
  final String? siteSub;
  final int? qty;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  final ProductDto? product;

  CartDto({
    this.id,
    this.productId,
    this.cartKey,
    this.siteSub,
    this.qty,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDtoToJson(this);

  Cart toCart() {
    return Cart(
      id: id,
      productId: productId,
      cartKey: cartKey,
      qty: qty,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      product: product?.toProduct(),
    );
  }
}
